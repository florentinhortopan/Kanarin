# Hardware

Target: a bead you can hold between two fingers, sample air every few minutes, glow red, and play haptic phrases — for days to weeks on a charge.

This is a **candidate stack**, not a frozen BOM. Every part is chosen because it currently looks small enough, low-power enough, and available enough for a first prototype. Alternatives and rejected paths are listed so later revisions have somewhere to argue.

## Constraints that actually bite

| Constraint | Why it matters |
| --- | --- |
| Envelope ~25–32 mm Ø, ~10–14 mm thick (fridge) | Fridge magnet bead. SCD41 (10.1 × 10.1 × 6.5 mm) already consumes the “tiny” budget by itself. |
| Wrist charm ~18–22 mm beak-to-tail, ~7–9 mm proud | Same Rams bird, closer to the eye. Cell **not** inside the bird — clasp / strap pouch. Ø8 mm LRA still fits under the belly. |
| Sample every 2–5 minutes | Matches human-scale air changes. Lets sensors sleep. |
| Red fill + haptic “tunes” | Needs a translucent shell, a real LED budget, and an LRA (not a cheap pager motor) so phrases are distinct. |
| Kitchen | Grease, steam, magnets, steel door, 0–40 °C, occasional splash. Optical PM inlets are hostile here. |
| No phone required | BLE is optional. MCU can be a BLE SoC anyway, used mostly asleep. |

## Recommended v0 sensing suite

Sense **stuffiness** and **smell**, plus the compensation sensors those chips need.

| Role | Part | Size | Interface | Why this one |
| --- | --- | --- | --- | --- |
| CO₂ (stuffiness) | Sensirion **STCC4** | 4.0 × 3.0 × 1.2 mm | I²C | One of the smallest direct CO₂ sensors. Thermal conductivity, ±(100 ppm + 10%) from 400–5000 ppm. Average **&lt;100 µA** in 10 s single-shot; ~1 µA deep sleep. Needs an SHT4x for compensation. |
| Temp / RH | Sensirion **SHT40** | 1.5 × 1.5 × 0.5 mm | I²C | Required neighbor of STCC4. Also useful as kitchen steam context. |
| VOC + NOx index | Sensirion **SGP41** | 2.44 × 2.44 × 0.85 mm | I²C | Cooking, cleaning, solvents. VOC index 0–500. Tiny. Hungry if left on (~3.0 mA @ 3.3 V) — must be duty-cycled. |
| Optional PM (not v0) | Bosch **BMV080** | sensing 4.4 × 3.0 × 3.0 mm, 20 mm with flex | proprietary / module | World’s smallest PM sensor, fanless. Needs a free-space optical window. Kitchen grease is a research problem. Defer. |

**Rejected for the bead, for now**

- **SCD41** — better CO₂ accuracy and single-shot pedigree, but 10.1 × 10.1 × 6.5 mm and ~0.5 mA average at 5 min samples. Fine for a puck, too proud for a bead.
- **Plantower / Sensirion SEN5x PM modules** — accurate, loud or bulky, fans, inlets. Not a bead.
- **eCO₂ from VOC-only** — tempting for size, dishonest as a ventilation signal. People produce CO₂; frying produces VOCs. Kanarin should know the difference.

### What “open the window” maps to on silicon

- **STCC4 rising through ~1000–1200 ppm** with a closed-room baseline around 400–600: classic stale air.
- **SGP41 VOC index climbing fast** (cooking, cleaners): air exchange even if CO₂ is fine.
- **SHT40** : compensate STCC4, ignore brief steam spikes, maybe a *soft* “boiling with no hood” hint later — not a v0 alert.

Accuracy honesty: STCC4 is not NDIR. It is good enough to notice a closed kitchen after dinner. It is not a calibration lab. Firmware should think in bands (fresh / stuffy / air it), not in displayed ppm.

## Compute

| Role | Candidate | Notes |
| --- | --- | --- |
| SoC | **Nordic nRF54L15** (prefer) or **nRF52840** | BLE 5, excellent sleep current, enough flash for Sensirion Gas Index + haptic tables. nRF54L15 is smaller/newer; nRF52840 is the known-quantity prototype chip (Dongle, Xiao nRF52840, etc.). |
| Prototype board | Seeed XIAO nRF52840, or a custom 4-layer round PCB | First bring-up does not need a round board. Second spin should be the bead PCB. |
| Avoid as product MCU | ESP32-C3 / S3 | Fine for a desk prototype, worse sleep story for a weeks-long bead. |

No display controller. No extra MCU. One chip, I²C sensors, one haptic driver, one RGB or dual-LED.

## Attention: light and haptic

### Light

- **RGB LED** (or warm amber + deep red, two emitters) lighting the **shell from inside**, not a front-facing indicator hole.
- Diffuser: translucent polymer, maybe a thin tinted inner cap so idle glow is canary-amber and alert is saturated red.
- Drive: low-current (1–5 mA) with PWM. Alert can be brighter; idle is barely there.

### Haptic “tunes”

Audio speakers are out. Distinct short phrases need a **linear resonant actuator**, not a brushed ERM pager motor.

| Part | Size | Notes |
| --- | --- | --- |
| LRA coin, e.g. Vybronics VG0832013D class | Ø 8 × ~3.2 mm | Z-axis, ~1 grms, typical ~60 mA while singing. Rise ~20–50 ms — short notes are possible. |
| Driver | TI **DRV2605L** (I²C) | Waveform library + licensed effects. Lets firmware compose phrases without bit-banging a sine at 235 Hz. Auto-resonance helps when the bead is on a steel fridge vs on a lanyard. |

ERM (eccentric rotating mass) is cheaper and easier to drive from a GPIO + MOSFET, but notes smear together. Keep ERM only for a crude first bench test.

Haptic current is the largest *peak* load after STCC4’s measure pulse. Size the PMIC and battery for ~80–100 mA peaks of a few hundred milliseconds, not for continuous buzz.

## Power

### Battery

- **Fridge:** LiPo 80–200 mAh inside the bead.
- **Wrist:** 40–80 mAh pouch in the clasp or along the strap (Fitbit Flex–style split). Do not pretend a 13×25×10 mm pin holds this stack plus a cell.
- Charge: **magnetic pogo dock** preferred over USB-C (USB-C eats the silhouette). Fridge: 2-pin puck. Wrist: pogos on the clasp.
- Protection: dedicated Li-ion protector + charge IC (e.g. MCP73831-class or a Nordic PMIC if the SoC spin includes it).

Coin cells (CR2032) will not honestly run STCC4 + SGP41 heater + LRA. Do not pretend.

### Rough budget (order of magnitude, 3.7 V cell, 3-minute cadence)

| Block | Duty | Average current (very rough) |
| --- | --- | --- |
| SoC deep sleep | always | 3–15 µA |
| STCC4 single-shot | ~seconds per 3 min | tens of µA |
| SHT40 | with STCC4 | negligible |
| SGP41 heater | ~1 s per sample (aggressive duty cycle; index quality TBD) | ~15–30 µA if 1 s / 180 s; **much more** if left in 1 Hz Sensirion-recommended mode |
| LED idle | rare dim pulse | ~5–20 µA |
| LED + LRA alert | rare | ignore in average if &lt;10 alerts/day |
| BLE advertising | off, or 1 s interval | 0, or tens–hundreds of µA |

**The SGP41 is the battery villain** if run as Sensirion’s 1 Hz index algorithm expects (~3 mA continuous → a 150 mAh cell dies in about two days). v0 firmware must duty-cycle it and accept a slower/less “official” VOC index, *or* accept a larger bead and a bigger cell.

Target for fridge-sitting, BLE mostly off: **1–4 weeks**. Target for daily wearable with occasional BLE: **several days**. Measure; do not believe this table.

## Mechanical / electrical extras

| Extra | Purpose |
| --- | --- |
| Hall sensor or reed | Magnet back present → fridge mode. Removed → wearable mode. |
| Optional IMU (BMI270-class, tiny) | Later: still vs walking, tap-to-snooze. Not required for v0. |
| Magnet | N52 disc in a removable sled, isolated from Hall if needed. |
| Adhesive option | 3M VHB or command-strip foot as an alternate sled (non-steel fridges, tiles). |
| Charge contacts | Two gold pads on the back, spring pins in the dock. |
| Enclosure openings | STCC4 and SGP41 need a vapor path. A hidden labyrinth or ePTFE membrane, not a hole in the face. Keep the membrane away from dishwasher-side splash. |

## Prototype path (hardware)

1. **Bench bird** — XIAO nRF52840 + SEK-STCC4 + SGP41 eval + DRV2605L breakout + RGB + LRA on a breadboard. Prove sampling, fusion, and haptic phrases.
2. **Puck** — round 40–50 mm 3D-printed shell, 150 mAh cell, same electronics. Wear it and fridge-magnet it. Learn false alarms.
3. **Bead** — custom 4-layer round PCB, STCC4+SHT40+SGP41+nRF+DRV2605L, magnetic charge, translucent shell. This is the first object that is Kanarin.

Do not skip step 1. Sensor fusion and haptic language are the product; the bead is packaging.

## Open hardware questions

- STCC4 in a sealed-ish bead: enough air exchange? Membrane choice vs kitchen grease?
- SGP41 duty cycle vs VOC index quality after cooking events.
- Whether a second-generation bead adds BMV080 with a grease-aware optical porch.
- Charge dock as a product accessory vs USB-C on a slightly fatter “kitchen only” sibling.
- Exact LED part and whether the whole shell glows or only a ring.
