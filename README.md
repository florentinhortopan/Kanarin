# Kanarin

A small indoor air-quality bead. It samples the room every few minutes. When a window should be opened, it turns red and vibrates a short tune.

The name is the canary: a quiet companion that notices stale, cooked, or chemically heavy air before you do.

This repository is the design history of Kanarin — concept, hardware, firmware, industrial design, and the decisions that change over time.

Public page (from the `web/` folder): [florentinhortopan.github.io/Kanarin](https://florentinhortopan.github.io/Kanarin/) — latest fridge stills, light states, and the interactive chirp player. No component specs.

After the first push, set **Settings → Pages → Source** to **GitHub Actions** if GitHub does not pick up the workflow on its own.

## The product in one loop

1. Sit still on a fridge, or ride on a slim wristband.
2. Wake every few minutes. Smell CO₂, VOCs, temperature, humidity.
3. Stay dark and silent if the air is fine.
4. If the air needs exchanging: glow red, play a short haptic phrase, then wait.
5. When the air recovers, go quiet again. No app required.

## Start here

| Doc | What it captures |
| --- | --- |
| [Concept](docs/concept.md) | Why it exists, what it does, what it refuses to be |
| [Hardware](docs/hardware.md) | Sensor stack, MCU, power, haptics, LED, BOM candidates |
| [Firmware](docs/firmware.md) | Sampling, “open the window” logic, haptic language, modes |
| [Form factor](docs/form-factor.md) | Bead geometry, fridge mount, wearable mount, kitchen constraints |
| [Expression](docs/expression.md) | Simplified canary personalities, posture levers, phase 2 mold matrix |
| [Decisions](docs/decisions.md) | Dated choices and open questions, so the design can evolve in the open |

Folders `hardware/` and `firmware/` hold design artifacts as they exist. Firmware haptic language: [firmware/haptics/](firmware/haptics/).

## Design stance

- **One job.** Tell a person to air the room. Not a dashboard, not a weather station, not a smoke alarm.
- **Bead, not brick.** Small enough to live on a fridge door or on a person.
- **Phone is optional.** The core loop is LED + haptic. BLE logging can come later.
- **Kitchen first.** Cooking VOCs, human CO₂, humidity from boiling. Particulates are a later generation.
- **Honest about tradeoffs.** Size, battery, and sensor physics fight each other. Those fights are written down.
