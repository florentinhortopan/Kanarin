# Expression matrix (phase 1)

How a **simplified canary pebble** can have different personalities without growing feathers, eyes, or gadget detail.

This is a prompt and mold guide for phase 2 renders. It is not CAD. Glow still means air (idle / caution / red alert). Personality is the **shell’s posture**, not a second color language.

Canonical fridge shape: `hardware/renders/canonical/kanarin-fridge-{off,idle,blue,alert}.png` (same Rams mold; light changes). Wearable still: `hardware/renders/kanarin-wearable-idle.png` (older sitting-bird until a matching pass).

## What the shell is allowed to do

The existing stills are one continuous volume: plump oval, tiny beak bump, short tail taper, no eyes, no wings, no legs. Personality has to live in that same budget.

| Lever | Allowed range | Why it works |
| --- | --- | --- |
| **Head attitude** | Up / level / down / tucked / cocked ~15–25° | Reads at 4 m. No face needed. |
| **Spine curve** | C (rest) / I (upright) / comma (sleep) / slight S (tense) | One silhouette change. |
| **Puff** | Loaf (max round) → perch (oval) → sleek (compressed) | Real canaries fluff vs sleek. |
| **Tail** | Up / level / down / absorbed into the loaf | Tiny triangle only. Never a fan. |
| **Beak** | Same bump, angled up / level / down; *slightly* longer for “song” | Still a nub, not an open bill. |
| **Mount attitude** | Proud (chest off the plane) / flush / slight roll left-right | Fridge and wearable stay flat. |
| **View** | Profile (canonical) / 3/4 / face-on peek | Face-on is an emerging-head cousin, still a wide root. |

Glow is **not** a personality lever. On the locked fridge mold the light family is **off / amber / blue / red**. Product meaning for blue is still open ([decisions](decisions.md)). A shy shell in alert is still the whole stone turning red.

## What we refuse

Do not use these in phase 2, even if they would “read” as a bird:

- Eyes, eyelids, brows, pupils (a faint dent already looks like a toy)
- Feathers, wings as separate forms, legs, claws, a perch stick
- Open beak cavity, tongue, nostrils
- Thin neck, lollipop stem, or any root too small for the v0 stack
- Chamfers, grommets, or collars on the fridge / backpack
- Cartoon smile/frown cut into the polymer
- Extra color (green-for-good, blush, two-tone paint)
- Text, logos, a “face plate”

If it needs a second part, it is too much.

## Vocabulary: expressions without a face

A real canary talks with body, not eyebrows. Mapped onto one pebble:

| Felt as | Silhouette move | Notes |
| --- | --- | --- |
| Neutral / present | Level head, oval body, tail slight down | Canonical stills. The Sentinel. |
| Curious | Head cocked 15–25°, beak a hair forward | Whole body can stay still. |
| Alert / lookout | Head up, body slightly longer, tail up | Sleeker, not thinner at the root. |
| Afraid / flinch | Head high-small, body compressed, tail tight | Sleeked feathers, not a stem. |
| Sleepy | Head tucked toward the “shoulder,” max round | Comma shape. Tail absorbed. |
| Content / loaf | Sphere-leaning oval, almost no tail or beak | More stone than bird. |
| Proud | Chest fuller, head slightly back, tail up | Keep the same bounding box. |
| Shy | Head down, more pebble, sits flush to the plane | Wants to disappear on a fridge. |
| Grump | Head down, C-curve hunch, tail down, beak down | Still cute, not sick. |
| Singing | Head lifted, chest open, beak bump *slightly* more pronounced | No open mouth. |
| Peeking | Face-on: crown + beak toward the viewer, wide root | Emerging-head family. Not a porthole. |
| Companion | 3/4 turn toward the wearer | Wearable story. Same volume. |

Body postures (same bird, different mold):

| Posture | One-line geometry |
| --- | --- |
| Perch | Canonical profile. Head–body–tail readable. |
| Stretch-up | Vertical bias. Head near the top of the 25–32 mm face. |
| Crouch | Horizontal bias. Head low. |
| Loaf | Near-disk / river stone. Bird is a rumor. |
| Tuck-sleep | Head merges into the mass. |
| Peek | Face-on bulge, body implied inside the plane. |
| Lean | Whole silhouette rotated ~20° on the mount (curious or tired). |
| Preen | Head curved back toward the tail — only if it still reads as one loaf. Easy to overdo; treat as optional. |

## Cuts: one 360° bird, fridge as a clipping plane

There is **one mouldable rubber canary** (a full 360° volume). Personalities are not different species. They are different **boolean cuts**: how that same bird intersects the flat fridge door.

The steel is a spatial plane. It does not grow a grommet, shelf, or hole-rim. The bird does not grow a stem. Whatever sits on this side of the plane is a wide rubber chunk, still able to hold the v0 stack.

| Cut ID | Name | What the plane does | You see |
| --- | --- | --- | --- |
| C1 | **Sagittal half** | Plane down the spine | One flank; classic profile relief |
| C2 | **Head burst** | Plane at the shoulders | Only head + beak. Wide root. |
| C3 | **Chest bust** | Plane through mid-body | Head, chest, maybe a wing bulge |
| C4 | **Shallow loaf** | Plane clips almost everything | Low dome; bird is a rumor |
| C5 | **Three-quarter emerge** | Plane clips one hip/wing | Most of the bird out, turned |
| C6 | **Horizontal rest** | Bird on its belly along the plane | Sleeping loaf, tucked head |
| C7 | **Vertical climb / edge wrap** | Bird oriented up the door, or the door *edge* as a second plane | Lower body in, head high; or wrapping the corner to look around |
| C8 | **Face-on bust** | Bird looks at you; plane behind the face | Crown + beak toward the room |

### Personality → best-fit cut

| ID | Personality | Cut | Why this cut |
| --- | --- | --- | --- |
| P1 | Sentinel | C1 Sagittal half | Present in profile. The quiet half-bird on the door. |
| P2 | Lookout | C7 Climb / edge wrap | Stretching up — or wrapping the door edge — to see the room. |
| P3 | Napper | C6 Horizontal rest | Asleep along the plane; tucked comma. |
| P4 | Nosy | C2 Head burst | Only the cocked head comes through to snoop. |
| P5 | Proud | C3 Chest bust | Chest and head puffed *out* of the door. |
| P6 | Shy | C1/C3 half, head down | Half-bird, flush, looking at the floor. Would rather stay inside. |
| P7 | Flinch | C1 Sagittal half, sleeked | Pressed into the plane, compressed profile. |
| P8 | Singer | C3 Chest bust, beak up | Announcing from the door, chest open. |
| P9 | Grump | C1 Sagittal half, hunched | Low C-curve half-bird, not climbing out. |
| P10 | Loaf | C4 Shallow loaf | Maximum pebble. Almost no bird left on this side. |
| P11 | Peek | C8 Face-on bust | Looking at you. Head (and maybe chest) only. |
| P12 | Companion | C5 Three-quarter emerge | Turned toward the person; most of the bird in the room. |

Phase 2 stills for this cut language live in `hardware/renders/personalities/cuts/` — do not overwrite the perched-shelf family in `personalities/`.

## Personality roster

Each row is a **different shell**, not an animation. Same guts, same sled, same envelope. Phase 2 generates these as idle (and later the same mold in red alert).

| ID | Personality | Who it is | Head | Body / puff | Tail | Beak | View | Default mount |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P1 | **Sentinel** | Quiet mine canary. Present until it isn’t. | Level | Perch oval | Slight down | Level nub | Profile | Fridge |
| P2 | **Lookout** | Stretching to see the room. | Up | Slightly sleek, taller | Up | Slight up | Profile | Fridge |
| P3 | **Napper** | Asleep on the door. Still a canary if you know. | Tucked | Loaf / comma | Absorbed | Hidden | Profile | Fridge |
| P4 | **Nosy** | Head cocked at the kettle. | Cocked 20° | Perch | Level | Forward | Profile or 3/4 | Either |
| P5 | **Proud** | Small chest, big opinion. | Slightly back | Puffed chest | Up | Slight up | Profile | Fridge |
| P6 | **Shy** | Would rather be a stone. | Down, small | Pebble, flush | Minimal | Down | Profile | Fridge |
| P7 | **Flinch** | Sleeked. Something in the air. | High, compact | Compressed | Tight | Tiny | Profile | Either |
| P8 | **Singer** | Announcing, not screaming. | Lifted | Open chest | Up | Slightly longer nub | Profile | Fridge |
| P9 | **Grump** | Hunched. Not today. | Down | C-curve | Down | Down | Profile | Fridge |
| P10 | **Loaf** | Maximum pebble. Bird optional. | Merged | Sphere-leaning | None | Tiny or none | 3/4 | Either |
| P11 | **Peek** | Coming through the plane at you. | Face-on | Chunky head, wide root | Hidden | Toward camera | Face-on | Fridge / pack |
| P12 | **Companion** | Turned toward the person cooking. | 3/4 to wearer | Perch | Level | Toward person | 3/4 | Wearable |

Product-state overlay (same mold, later stills):

| State | Light | Do not also… |
| --- | --- | --- |
| Off | Unlit frost; only room light | Add a face |
| Idle | Whole-body amber | Add a smile |
| Blue | Whole-body cool blue | Invent a second UI |
| Alert | Whole shell saturated red | Change the personality pose |

Alert on **Napper** or **Loaf** is interesting: a round stone that goes red. Alert on **Lookout** or **Flinch** is on-the-nose. Phase 2 should try both.

## Envelope rules (so personality does not break hardware)

- Face 25–32 mm, thickness 10–14 mm, mass ~12–25 g. Stretch-up and loaf still fill that box; they do not grow a neck.
- Flat back for the sled. Personality is the **front volume**.
- Root against fridge or fabric stays wide. Fillet on the bird is allowed; a stem is not ([decisions](decisions.md)).
- One part. Ultrasonic weld / hidden screws from the sled face later. No glued-on beak.

## Phase 2 prompt recipe

For each `P#`:

1. Lock style: *one continuous smoked-bone / straw-amber translucent polymer pebble, matte satin, no eyes, no feathers, no wings, no legs, no logo, no stem, no hole in the door.*
2. Name the personality and paste the row’s head / body / tail / beak / view.
3. Name the **cut** (C1–C8). The fridge is a boolean clipping plane through the same 360° bird. Do not generate twelve perched full birds.
4. Place it: fridge side at eye height, or apron/backpack clip. Plane stays flat — no grommet, shelf, or ring.
5. Generate **idle** first. Red alert is a second pass on the same silhouette.
6. If it grows an eye, a grommet, a perch shelf, or a fridge interior, discard; do not “fix” by adding more detail.

Suggested first wave (covers the range without 12 molds): **P1 Sentinel, P3 Napper, P4 Nosy, P6 Shy, P11 Peek, P12 Companion.**

Second wave: P2, P5, P7, P8, P9, P10.

## Open

- Whether Peek (face-on) is a second SKU or the same bead seen from the front of a more 3D bird.
- Whether Loaf is so abstract it stops being a canary from across the kitchen.
- Whether we ever ship more than one personality, or this matrix is only to pick a single mold.
- Whether **blue** is a product state (night, charging, “clear”) or only a light study on the locked mold.
