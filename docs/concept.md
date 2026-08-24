# Concept

Kanarin is a pebble-sized indoor air sentinel. It lives two lives: magnetized or stuck to a kitchen fridge, or worn as a small bead. Every few minutes it asks a single question: *does this air need a window?*

If yes, it turns red and vibrates a short, recognizable tune. If no, it stays quiet.

## Why this exists

Indoor air goes bad without looking different. A kitchen after frying, a closed apartment after guests, a room after cleaning spray — the air is heavier, but nothing in the room announces it. People notice late: headache, smell clinging to clothes, a stuffy night.

Most air-quality gadgets answer with charts, apps, and numbers. Kanarin answers with a canary: one signal, one action.

The action is always the same. **Open a window** (or crack a door, run the hood, step outside). The device does not try to purify, log a wellness score, or lecture. It nags, briefly, then waits.

## What it is

- A **bead** roughly 25–32 mm across, thick enough for a cell and a tiny haptic motor, thin enough to sit on a fridge without looking like a gadget brick.
- A **sampler**, not a stream. Measurements every 2–5 minutes, faster only when air is already drifting toward a threshold.
- A **binary-plus companion**. Off / warm idle / amber caution / red alert. Haptic phrases carry urgency, not data.
- A **dual-home object**. Fridge sentinel for the room (locked Rams bead). Wristband for the person (same bird, smaller, cell in the clasp).

## What it is not

- Not a carbon monoxide alarm, smoke alarm, or life-safety device. Those have legal and reliability requirements Kanarin will not fake.
- Not a scientific CO₂ logger. The first CO₂ sensor (STCC4) is small and good enough for “stuffy vs fresh,” not for WELL/RESET certification.
- Not a phone accessory. Pairing may exist later for firmware updates and optional history. The product must work if the phone is in another room.
- Not a speaker. “Tunes” are haptic rhythms, not audio. A kitchen already has enough noise.

## The canary metaphor, taken literally

A canary in a mine was useful because it was *present, small, and obvious when something was wrong*. Kanarin should feel like that:

| Canary | Kanarin |
| --- | --- |
| Lives where the people are | Fridge in the kitchen, or on a person |
| Quiet until it isn’t | Dark until red |
| One unmistakable signal | Red + a short haptic phrase |
| You act immediately | Open a window |
| You don’t read a chart | No ppm on the object |

The shell should read as an object, not a gadget: a warm, slightly translucent stone. Idle light, if any, is a dim canary-amber heartbeat. Alert light is red that fills the body, not a piercing LED dot.

## Two homes, one brain

### Fridge (room sentinel)

The kitchen is the worst indoor air in most homes: cooking VOCs, steam, people gathering, windows often shut. A fridge door is eye-height, magnetic, away from the hottest steam plume if placed on the side or upper door, and visited constantly.

In this mode Kanarin watches the *room*. Thresholds can be a little slower and a little more patient (cooking happens; a two-minute VOC spike is not always “open the window”).

### Wearable (personal sentinel)

A slim bone/sand wristband puts the same Rams bird on the person, smaller (18–22 mm). Haptic phrases are felt in the skin, not as a buzz on fridge steel. Thresholds are personal-exposure oriented. Walking from room to room should not look like a crisis.

Apron clip and loop remain sled options. A Hall / reed on the magnet back tells firmware fridge vs wrist without an app.

## The “open the window” question

Stale indoor air is usually a mix of:

1. **CO₂** — people, closed rooms, overnight bedrooms, dinner parties. The classic ventilation signal.
2. **VOCs** — cooking, cleaning products, new furniture, alcohol, solvents. The classic “this kitchen smells processed” signal.
3. **Humidity / temperature** — supporting context (boiling, shower steam leaking in, sensor compensation), not a primary alert by themselves.
4. **PM2.5** — frying smoke, candles, wildfire days. Valuable, but the smallest honest PM sensor still wants an optical window that kitchens will grease. **Deferred.** See [hardware](hardware.md).

Firmware fuses (1) and (2) into a single alert, with different haptic phrases so a curious user can learn *why* without numbers. Details in [firmware](firmware.md).

## Success looks like

- Someone glances at the fridge, sees red, opens the kitchen window, and the bead fades over the next few minutes.
- Someone wears it at a desk, feels two short pulses, cracks a window, and does not open an app.
- It lasts days to weeks on a charge, not hours.
- It is believed. False alarms from a single onion in a pan should be rare. Missed “we’ve been six people in here for an hour” should be rarer.

## Explicit non-goals for v0

- Companion app, cloud, maps of outdoor AQI.
- Color displays, e-ink, or any UI beyond light + haptic.
- Outdoor use, waterproofing for showers, or bike-mount sports telemetry.
- Multi-room mesh. One bead, one place (or one person).
