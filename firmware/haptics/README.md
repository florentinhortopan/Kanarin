# Haptics

Named canary **gestures**, not Morse. Light is the shell; chirp shape is the sentence.

| File | Role |
| --- | --- |
| [phrases.json](phrases.json) | Source of truth — sweeps, timings, light pairing |
| [play.html](play.html) | Heard (2–6 kHz chirps) vs felt (235 Hz LRA envelopes) |

A real canary syllable is a **frequency sweep** 20–200 ms long, usually 2–7 kHz. Phrases repeat one syllable. We steal those *shapes* (upsweep contact, twitter trill, descending alarm, falling whistle, greeting chip) and keep each motif under ~0.5 s.

The Ø8 mm LRA cannot change pitch like a bird. Firmware later plays the **same envelopes** at resonance. Open `play.html`, leave Voice on **Heard**, and learn the five chirps.

Fridge gain 1.0, wearable 0.55 — same shape, different force.

Living spec: [docs/firmware.md](../../docs/firmware.md#haptic-language).
