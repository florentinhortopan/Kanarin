# Kanarin

Two homes, one canary. A pebble on the fridge, a bead on the wrist. Quiet until the air isn’t.

The name is the mine bird: present, small, obvious when something is wrong. Not a dashboard, not a smoke alarm, not an app.

This repository is the design history of Kanarin — concept, hardware, firmware, industrial design, and the decisions that change over time.

## Public page

[florentinhortopan.github.io/Kanarin](https://florentinhortopan.github.io/Kanarin/) is the product story. Source: `web/`. GitHub Pages serves the **`gh-pages`** branch at **`/`** (a flattened copy of `web/`). Pushing `main` does not update the live site.

After changing the page:

```bash
./scripts/publish-pages.sh
```

The page is **Cook · Wear · Hear**. It does not list component part numbers.

## Two homes

**Cook** — locked Rams canary on kitchen steel. Same bird, same fridge; the glow changes, and the chirp with it. Light states: Breathe (blue), Idle (off), Caution (amber), Alert (red). Canonical stills live in `hardware/renders/canonical/`.

**Wear** — the same outline, smaller, as a one-piece bone strap (the band *is* the bird). Indoor bird on the fridge; outdoor bird on the trail. When a fire is close, the air can go wrong before the ridge looks like it. The bird turns red. The chirp is felt. Jewelry, not a tracker.

Firmware may tell fridge from wrist (Hall / reed on the magnet back) without an app.

## Language

Light is the body. Chirps are named phrases on the *edges* — when the air changes, not every sample. Idle, Caution, and Breathe stay silent.

| Phrase | Gesture | When |
| --- | --- | --- |
| `air` | contact double-cheep | Stuffy — open a window |
| `cook` | fast twitter trill | Kitchen air |
| `both` | alarm descending verse | Both agree |
| `clear` | soft downsweep whistle | Recovering, sparingly |
| `dock` | greeting peck | Charging started |

Heard preview is canary-range FM so you can learn the gestures. The object has no speaker; on the bead they are felt. Source of truth: [firmware/haptics/phrases.json](firmware/haptics/phrases.json). Player: [firmware/haptics/play.html](firmware/haptics/play.html).

## The product in one loop

1. Sit on a fridge, or ride on a wrist.
2. Wake every few minutes. Sample the air. Stay dark and silent if it is fine.
3. If the air needs exchanging: the whole bird turns red, a short phrase plays, then it waits.
4. Kitchen: open a window (or the hood, or a door). Trail: the chirp is felt — turn toward cleaner air.
5. When the air recovers, go quiet again. No app required.

## Start here

| Doc | What it captures |
| --- | --- |
| [Concept](docs/concept.md) | Why it exists, what it does, what it refuses to be |
| [Hardware](docs/hardware.md) | Sensor stack, MCU, power, haptics, LED, BOM candidates |
| [Firmware](docs/firmware.md) | Sampling, fusion, haptic language, fridge vs wrist |
| [Form factor](docs/form-factor.md) | Rams fridge mold, oneshot wrist, mounts |
| [Expression](docs/expression.md) | Canary personalities, posture, mold matrix |
| [Decisions](docs/decisions.md) | Dated choices — this file wins when docs disagree |

`hardware/` and `firmware/` hold artifacts as they exist. Do not overwrite `hardware/renders/canonical/`.

## Design stance

- **One signal, one action.** Red + a short phrase. Not ppm on the object.
- **Two weathers.** Kitchen sentinel and personal bead. Same brain.
- **Phone is optional.** Light and haptic are the product. BLE can come later.
- **Object, not gadget.** Translucent frost, whole-body glow, no screen, no logo farm.
- **Not life-safety.** Not CO, not smoke, not a wildfire siren. It nags, then waits.
- **Honest about tradeoffs.** Size, battery, and sensor physics fight each other. Those fights are written down.
