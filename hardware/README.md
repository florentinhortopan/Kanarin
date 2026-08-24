# Hardware artifacts

This folder will hold schematics, PCB, CAD, BOM, and photos as they exist.

Until CAD exists, the living spec is [docs/hardware.md](../docs/hardware.md).

## Renders

Concept stills from the form-factor spec (bead ~25–32 mm, translucent bone/smoke shell, fridge + wearable sleds). Not CAD.

**Locked fridge shape** (Dieter Rams pass): one continuous canary volume, precise radii, no eyes or grooves, flush to a flat white plane. Light is the only variable. Do not overwrite `canonical/`.

| File | State |
| --- | --- |
| [renders/kanarin-fridge-off.png](renders/kanarin-fridge-off.png) | Unlit frost *(canonical)* |
| [renders/kanarin-fridge-idle.png](renders/kanarin-fridge-idle.png) | Whole-body amber *(canonical)* |
| [renders/kanarin-fridge-blue.png](renders/kanarin-fridge-blue.png) | Whole-body blue *(canonical)* |
| [renders/kanarin-fridge-alert.png](renders/kanarin-fridge-alert.png) | Whole-body red alert *(canonical)* |
| [renders/kanarin-wearable-idle.png](renders/kanarin-wearable-idle.png) | Wearable clip on an apron, idle amber *(canonical mount still; older sitting-bird)* |
| [renders/kanarin-wristband-off.png](renders/kanarin-wristband-off.png) | Smaller Rams bird on a slim bone strap, unlit *(study)* |
| [renders/kanarin-wristband-idle.png](renders/kanarin-wristband-idle.png) | Same wrist charm, amber idle, linen hero *(study)* |
| [renders/kanarin-wristband-alert.png](renders/kanarin-wristband-alert.png) | Same wrist charm worn, whole-body red *(study)* |
| [renders/kanarin-wristband-oneshot-off.png](renders/kanarin-wristband-oneshot-off.png) | One-piece LSR: strap swells into the canary, unlit |
| [renders/kanarin-wristband-oneshot-idle.png](renders/kanarin-wristband-oneshot-idle.png) | One-piece LSR, amber through the bird volume |
| [renders/kanarin-wristband-oneshot-alert.png](renders/kanarin-wristband-oneshot-alert.png) | One-piece LSR, red through the bird volume |
| [renders/kanarin-wristband-oneshot-worn-idle.png](renders/kanarin-wristband-oneshot-worn-idle.png) | Same oneshot object on a wrist, amber |
| [renders/kanarin-wristband-oneshot-worn-alert.png](renders/kanarin-wristband-oneshot-worn-alert.png) | Same oneshot object on a wrist, red |
| [renders/kanarin-wristband-flat-off.png](renders/kanarin-wristband-flat-off.png) | Oneshot flattened to fridge cameo, unlit |
| [renders/kanarin-wristband-flat-idle.png](renders/kanarin-wristband-flat-idle.png) | Fridge-alert flattening, amber, 3/4 |
| [renders/kanarin-wristband-flat-alert.png](renders/kanarin-wristband-flat-alert.png) | Fridge-alert flattening, red, 3/4 |
| [renders/kanarin-wristband-flat-alert-top.png](renders/kanarin-wristband-flat-alert-top.png) | Same flattened relief, top-down, red |
| [renders/kanarin-wristband-flat-worn-alert.png](renders/kanarin-wristband-flat-worn-alert.png) | Flattened cameo on a wrist, red |
| [renders/kanarin-wearable-alert.png](renders/kanarin-wearable-alert.png) | Same apron bird, whole-body red |
| [renders/kanarin-bead-hero-idle.png](renders/kanarin-bead-hero-idle.png) | Isolated 3/4 product still, idle |
| [renders/kanarin-fridge-across-room.png](renders/kanarin-fridge-across-room.png) | Kitchen-distance view, red fill as the signal |
| [renders/kanarin-fridge-emerging-idle.png](renders/kanarin-fridge-emerging-idle.png) | Face/beak only, coming through the fridge door, idle |
| [renders/kanarin-fridge-emerging-alert.png](renders/kanarin-fridge-emerging-alert.png) | Face/beak only, coming through the fridge door, red |
| [renders/kanarin-backpack-emerging-idle.png](renders/kanarin-backpack-emerging-idle.png) | Face/beak only, coming through a backpack, idle |
| [renders/kanarin-backpack-emerging-alert.png](renders/kanarin-backpack-emerging-alert.png) | Face/beak only, coming through a backpack, alert |
| [renders/kanarin-fridge-emerging-squeeze-idle.png](renders/kanarin-fridge-emerging-squeeze-idle.png) | Face/beak through a tight chamfered fridge hole, idle |
| [renders/kanarin-backpack-emerging-squeeze-idle.png](renders/kanarin-backpack-emerging-squeeze-idle.png) | Face/beak through stretched backpack fabric, idle |
| [renders/kanarin-backpack-emerging-squeeze-alert.png](renders/kanarin-backpack-emerging-squeeze-alert.png) | Face/beak through stretched backpack fabric, alert |

`rejected/` — not the product. Thin-stem / lollipop tapers cannot house the stack (see [docs/decisions.md](../docs/decisions.md)). Do not use as the form.

`history/` — pre-Rams fridge stills and extra Rams studies. Not the locked mold.

## Personality mocks (phase 2)

`personalities/` — first pass, perched rubber family (some grew a shelf). Keep as history.

`personalities/cuts/` — same 360° rubber canary, **fridge as clipping plane**. Cut follows [docs/expression.md](../docs/expression.md).

| File | Personality | Cut |
| --- | --- | --- |
| [personalities/cuts/p1-sentinel-sagittal.png](personalities/cuts/p1-sentinel-sagittal.png) | P1 Sentinel | Sagittal half |
| [personalities/cuts/p2-lookout-climb.png](personalities/cuts/p2-lookout-climb.png) | P2 Lookout | Climb / wrap the door edge |
| [personalities/cuts/p3-napper-horizontal.png](personalities/cuts/p3-napper-horizontal.png) | P3 Napper | Horizontal rest along the plane |
| [personalities/cuts/p4-nosy-headburst.png](personalities/cuts/p4-nosy-headburst.png) | P4 Nosy | Head burst |
| [personalities/cuts/p5-proud-chestbust.png](personalities/cuts/p5-proud-chestbust.png) | P5 Proud | Chest bust |
| [personalities/cuts/p6-shy-half.png](personalities/cuts/p6-shy-half.png) | P6 Shy | Half-bird, flush |
| [personalities/cuts/p7-flinch-pressed.png](personalities/cuts/p7-flinch-pressed.png) | P7 Flinch | Pressed sagittal half |
| [personalities/cuts/p8-singer-chestbust.png](personalities/cuts/p8-singer-chestbust.png) | P8 Singer | Chest bust, head up |
| [personalities/cuts/p9-grump-sagittal.png](personalities/cuts/p9-grump-sagittal.png) | P9 Grump | Hunched sagittal half |
| [personalities/cuts/p10-loaf-shallow.png](personalities/cuts/p10-loaf-shallow.png) | P10 Loaf | Shallow half |
| [personalities/cuts/p11-peek-faceon.png](personalities/cuts/p11-peek-faceon.png) | P11 Peek | Face-on bust |
| [personalities/cuts/p12-companion-threequarter.png](personalities/cuts/p12-companion-threequarter.png) | P12 Companion | Three-quarter emerge |
