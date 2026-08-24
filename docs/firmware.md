# Firmware

Firmware is the canary’s nervous system: sleep, sniff, decide, speak in light and vibration, sleep again.

There is no UI firmware in v0. No screens, no menus. Optional BLE comes after the bead is believable on its own.

## Runtime shape

```
deep sleep
  → RTC wake (2–5 min, or 30 s if already in caution)
  → power sensors
  → STCC4 single-shot + SHT40
  → SGP41 short heat / sample
  → fuse → state
  → LED (and LRA if the state just worsened)
  → power down sensors
  → deep sleep
```

Wake for a tap (if a button or IMU tap exists later): snooze 30–60 minutes. Wake on charge dock: charging glow, no alerts.

### Cadence

| Situation | Sample interval | Why |
| --- | --- | --- |
| Fresh, stable | 5 minutes | Battery. Air does not collapse in 30 seconds. |
| Drifting toward caution | 2 minutes | Catch a dinner party or a stew. |
| Caution or alert | 30–60 seconds | See recovery after a window opens. |
| Just snoozed | 5 minutes, alerts suppressed | Respect the human. |

STCC4 response time is ~20 s; SCD-class NDIR is ~60 s. Sampling faster than that is mostly ego.

## Sensing pipeline

### CO₂ (STCC4 + SHT40)

1. Feed live T/RH into STCC4’s compensation path (as the datasheet requires).
2. Keep a **slow baseline**: 24–48 h percentile of the lowest readings (a poor-person’s outdoor reference). Photoacoustic/thermal sensors drift; a baseline keeps “stuffy” relative to *this* home.
3. Work in **bands**, not displayed ppm:

| Band | Rough meaning | Typical trigger (adjust after field data) |
| --- | --- | --- |
| Fresh | Outdoor-ish | baseline … baseline+350 ppm |
| Stuffy | Closed room | ~1000 ppm absolute, or +500 over baseline |
| Air it | Open a window | ~1400 ppm, or +800 over baseline, with persistence |

Persistence: 2–3 consecutive samples in-band before escalating. One weird sample is not a canary event.

Automatic self-calibration assumptions: this bead may live in a never-opened apartment. Do not blindly assume a weekly 400 ppm visit. Prefer a slow min-tracker plus a conservative absolute ceiling.

### VOC / NOx (SGP41)

Sensirion’s Gas Index Algorithm wants ~1 Hz samples and a long conditioning time. That algorithm is excellent and battery-hostile.

**v0 plan:** duty-cycled raw signals, a simpler on-device index:

- Maintain a slow VOC baseline (hours).
- Alert on **rate of rise** (cooking, spray) and on **sustained elevation** (lingering oil, cleaners).
- NOx is interesting near gas stoves; treat as a supporting feature, not the headline, until we have kitchen traces.

Log raw ticks during prototypes even if the product never shows them. Kitchen traces are how thresholds get real.

### Fusion: one question

```
need_window = persist(co2_band >= stuffy) OR persist(voc_event)
```

- CO₂-only stuffy → haptic phrase **A** (long-closed room).
- VOC-only event → phrase **B** (kitchen/chemistry).
- Both → phrase **C** (stronger, “really air this”).

Humidity spikes without CO₂/VOC stay silent (kettle). Temperature is compensation, not an alarm.

**This is not a safety product.** CO from a faulting heater, smoke from a fire: out of scope. Do not add “emergency” patterns that imply otherwise.

## State machine

```
OFF (uncharged / shipping)
IDLE          dim or dark
CAUTION       slow amber breathe, no haptic yet
ALERT         red fill + haptic phrase, then red hold
RECOVERING    red → amber → idle as bands fall
SNOOZE        idle rules, alerts muted
CHARGING      slow pulse, sensing optional/slow
```

Transitions:

- IDLE → CAUTION on first band breach.
- CAUTION → ALERT after persistence (and not snoozed).
- ALERT → RECOVERING when both CO₂ and VOC have been back in fresh for N samples (windows take minutes).
- Any → SNOOZE on tap / dock-button (hardware TBD).
- Magnet present (Hall) → **fridge profile**; absent → **wearable profile**.

### Profiles

| | Fridge | Wrist (and other wearables) |
| --- | --- | --- |
| VOC patience | More (cooking is the job of the room) | Less (this is *your* air) |
| Haptic | Stronger — must move a steel door a little | Soft but crisp; LRA into skin is the primary signal |
| LED | Can be brighter; fridge is glanced at | Dimmer, especially at night; no disco in bed |
| Night | Kitchen can glow; nobody is there | Wrist is in bed with the person — haptic over light |

v0 can hardcode quiet hours only if we have time (RTC). Until then: no clock, no night mode.

## Haptic language

Phrases should be **short, named, and learnable**. Not Morse. They steal *shapes* from real canary syllables — frequency sweeps, not flat dots.

A domestic canary (*Serinus canaria*) builds song from **syllables** (typically 20–200 ms, 2–7 kHz, upsweep / downsweep / whistle / complex) repeated into **phrases** (~0.5–1.5 s). Calls sit outside song: contact cheeps all day; alarms are shorter and more urgent. Song often *climaxes* in loud hard **descending** syllables. Fast FM trills (~13 syllables/s) are a known, salient gesture. We never play a full song (5–15 s). Each product motif stays under ~0.5 s.

| Name | Canary gesture | Heard shape | Meaning |
| --- | --- | --- | --- |
| `air` | Contact double-cheep | two rising chirps | CO₂ / stuffy — open a window |
| `cook` | Fast twitter trill | four falling ticks ~13/s | VOC event |
| `both` | Alarm / climax verse | two steep drops + falling whistle | both sensors agree |
| `clear` | Soft downsweep whistle | one quiet fall | recovering (use sparingly) |
| `dock` | Greeting peck | two high chips | charging started |

Heard preview (speakers): 2–6 kHz FM, see [`firmware/haptics/play.html`](../firmware/haptics/play.html). Felt hardware: same envelopes at LRA resonance (~235 Hz). An Ø8 mm LRA cannot sing a bird; pitch lives in the design language, rhythm lives on the bead. Table: [`firmware/haptics/phrases.json`](../firmware/haptics/phrases.json).

Rules:

- Play a phrase **on edge** (entering ALERT, or escalating IDLE→ALERT), not every sample.
- Retrigger at most every 10–15 minutes if still ALERT (fridge nag). Wearable: even less often.
- Never overlap LED animation and a second haptic while the first is playing.

## Light language

| State | Light |
| --- | --- |
| IDLE | Off, or 1% amber blip every sample so it feels alive |
| CAUTION | Slow amber breathe |
| ALERT | Saturated red, body-fill, hold |
| RECOVERING | Red ease to amber |
| CHARGING | Slow amber pulse |
| Battery low | Rare double amber blink at sample time — not a red alert |

PWM on a 16-bit timer. No blocking `delay()` in animation; sample loop must stay able to sleep.

## BLE (later)

Not in the critical path.

When added:

- Advertising name `Kanarin`.
- Bonding optional.
- Notify: state, bands, battery, firmware rev.
- Write: snooze, interval cap, LED brightness, haptic gain.
- OTA via Nordic DFU.

The bead must remain correct if nobody ever pairs.

## Firmware architecture (when code exists)

Suggested layout under `firmware/`:

- `app/` — state machine, fusion, cadence
- `drivers/` — STCC4, SHT40, SGP41, DRV2605L, LED, Hall, charger
- `hal/` — nRF sleep, I²C, timers
- `haptics/` — named phrases
- `ble/` — later
- `tests/` — host-side fusion tests with recorded kitchen traces (no hardware)

Bring-up order: LED → sleep current → SHT40 → STCC4 → SGP41 → fusion on serial → DRV2605L phrases → Hall profiles → enclosure.

## Logging for evolution

On the bench, dump CSV over USB/RTT:

`t, co2, rh, t_c, voc_raw, nox_raw, band, state, haptic`

Kitchen evenings are the dataset. Thresholds in this doc are guesses until those files exist.

## Open firmware questions

- How short can an SGP41 on-time be and still see a garlic/onion fry?
- Baseline strategy for apartments that never go to 400 ppm.
- Whether `clear` haptic is delightful or annoying.
- Tap-to-snooze hardware: button vs IMU vs twist.
- Need for a shipping / “I’m in a box” mode so warehouse CO₂ doesn’t drain the cell in ALERT.
