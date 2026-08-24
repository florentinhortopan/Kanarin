# Decisions

A running log of choices. Newest first. When something here conflicts with an older doc, **this file wins** until the docs are updated.

Status: `accepted` · `proposed` · `open` · `superseded`

## 2026-08-24 — Wrist oneshot flattened to the fridge cameo

**Status:** proposed

The plump oneshot bird is squashed to the canonical fridge relief: a low-profile cookie / cameo, not a round figurine. Same Rams outline, one-piece frost rubber, light through the bird. New stills `kanarin-wristband-flat-*.png`. Earlier oneshot and charm files are kept.

## 2026-08-24 — Wrist oneshot: the band is the bird

**Status:** proposed

A second wrist construction besides the charm-on-strap studies. One continuous frost rubber: the strap swells into the Rams canary; the PCB lights through that thicker volume. Charm stills (`kanarin-wristband-{off,idle,alert}.png`) are kept. New stills: `kanarin-wristband-oneshot-*.png`.

## 2026-08-24 — Personal wearable is a smaller Rams wristband

**Status:** proposed

The locked fridge canary stays 25–32 mm. The personal home is the **same mold language, scaled to ~18–22 mm beak-to-tail**, on a slim 10–12 mm bone/sand strap. Not a 13×25×10 mm PCB pin, not a black sports tracker, not the fridge bead glued onto a watch.

How it gets smaller without a stem: **split the stack**. Bird holds sensors (dorsal air path), LED, nRF, Ø8 mm LRA. Pouch cell lives in the clasp / strap. Sensors never sit against skin.

Studies: `hardware/renders/kanarin-wristband-{off,idle,alert}.png`. Canonical fridge stills are untouched.

Apron clip remains a sled option. Wrist is the nice personal object.

## 2026-08-24 — Fridge canonical is the Rams canary

**Status:** accepted

The to-keep fridge form is the Dieter Rams pass: one continuous translucent volume, tiny beak tangent, short tail taper, no eye, no wing grooves, flush to a flat fridge plane. Light is the only product variable on that mold.

Locked stills in `hardware/renders/canonical/`:

- `kanarin-fridge-off.png` — unlit frost
- `kanarin-fridge-idle.png` — whole-body amber
- `kanarin-fridge-blue.png` — whole-body blue (visual variant; product meaning still open)
- `kanarin-fridge-alert.png` — whole-body red

Earlier fridge-alert/idle stills live in `hardware/renders/history/`. Wearable canonical is still the older sitting-bird until a matching Rams pass.

Do not grow a second color language for personality. Glow still means air / power, not mood.

## 2026-08-24 — Haptic language is named phrases on light edges

**Status:** accepted

Phrases live in `firmware/haptics/phrases.json`. Simulation: `firmware/haptics/play.html` (speaker at ~235 Hz, optional `navigator.vibrate`). Real driver remains DRV2605L + Ø8 mm LRA.

Pairing: off / idle / blue / caution are silent. Alert red plays `air` (contact cheep / CO₂), `cook` (twitter trill / VOC), or `both` (descending alarm). Optional `clear` (falling whistle) on recover, `dock` (greeting chips) on charge. Heard preview is 2–6 kHz FM; the bead still feels envelopes at LRA resonance.

## 2026-08-24 — Emerging bird is a chunky head, not a stem

**Status:** accepted

Renders that cinch the canary into a thin lollipop/thumbtack stem (`hardware/renders/rejected/kanarin-*-taper-*.png`) are **not the product**. They cannot hold the v0 stack (STCC4 + SHT40 + SGP41 + nRF + Ø8 mm LRA + 80–200 mAh pouch) inside a 25–32 mm × 10–14 mm bead.

Also rejected: chamfering the **fridge or backpack** (raised grommet, collar, recessed socket). The mount plane stays flat. Any “squeezing through a tight hole” lives in the **bird’s own volume** — a slight fillet at a still-wide root — not in a skinny neck and not in a lip on the door.

## 2026-08-24 — Repository exists to capture design evolution

**Status:** accepted

This repo is the product notebook: concept, hardware, firmware, form. Schematics and firmware land later in `hardware/` and `firmware/`.

## 2026-08-24 — One job: open a window

**Status:** accepted

Kanarin is not a dashboard, not a safety alarm, not an app. Red + a short haptic phrase means air the room. Phone is optional forever.

## 2026-08-24 — Dual home: fridge and wearable

**Status:** accepted

Same bead. Magnet or adhesive sled for kitchen steel/tile. Clip/loop sled for a person. Firmware may distinguish the two (Hall / reed on the magnet sled).

## 2026-08-24 — v0 sensors are CO₂ + VOC, not PM

**Status:** accepted

STCC4 + SHT40 + SGP41. Bosch BMV080 is the interesting PM future, but kitchen grease + optical free-space is a generation-two research problem. eCO₂-from-VOC-only is rejected as a ventilation lie.

## 2026-08-24 — Bead envelope over SCD41 accuracy

**Status:** accepted

SCD41 is the honest NDIR-class small sensor and is too big/power-hungry for a bead. STCC4 is the size/power bet, with weaker accuracy, bands not ppm.

## 2026-08-24 — Haptics are LRA phrases, not a speaker, not a pager buzz

**Status:** accepted

DRV2605L + Ø8 mm LRA. ERM only for bench timing sketches. Phrase table: `firmware/haptics/phrases.json`.

## 2026-08-24 — Nordic BLE SoC, even if BLE ships later

**Status:** proposed

nRF54L15 preferred, nRF52840 for first prototypes. ESP32 is bench-only.

---

## Open

| ID | Question | Lean |
| --- | --- | --- |
| O1 | SGP41 1 Hz index vs aggressive duty cycle | Duty cycle for v0 battery; measure cooking traces |
| O2 | Charge: magnetic pogo vs USB-C | Magnetic for the bead |
| O3 | Night quiet hours | After RTC / wearable tests |
| O4 | Tap-to-snooze hardware | Unknown; needed before anyone lives with it. Wrist makes tap-the-bird obvious. |
| O5 | Shell color | Bone/smoke over toy yellow, still warm |
| O6 | Shipping mode | Needed before any charged inventory |
| O7 | PM generation | BMV080 study after kitchen grease tests |
| O8 | Companion app | Not v0 |
| O9 | Wrist vs fridge as first SKU | Fridge remains the kitchen hero; wrist is the nice personal object |
| O10 | Clasp cell vs slightly fatter bird | Lean clasp split so the charm stays 7–9 mm proud |

When an open item closes, add a dated entry above and leave a one-line pointer here.
