# Form factor

Kanarin should feel like a **small stone that can live two lives**: stuck to a kitchen fridge, or worn. Not a USB stick, not a smartwatch, not a square IAQ brick.

Working nickname: **the bead**.

## Target geometry

| | Target | Rationale |
| --- | --- | --- |
| Face | 25–32 mm | Large enough to glow as a body, small enough to be a bead / fridge pebble |
| Thickness | 10–14 mm | Cell + Ø8 mm LRA + PCB + shell. Thinner is a later miracle. |
| Mass | ~12–25 g | Wearable all day; fridge magnet must still hold on a painted steel door |
| Shape | Rounded pill / river stone | No sharp gadget corners. Sits in a palm. Does not scream “IoT.” |
| Emerging-head variant | Same internal volume | Face/beak may read as coming through a fridge or pack, but the root stays wide enough for the stack. No thin stem. No chamfer on the door. |

If the stack refuses to fit, grow to a **puck** (~40 mm) for prototypes without changing the interaction. The puck is a learning device. The bead is the product.

## Visual language

Locked fridge stills: `hardware/renders/canonical/kanarin-fridge-{off,idle,blue,alert}.png` — one Rams canary, light is the only variable.

- **Translucent frost shell** (bone / smoked polymer) so light is a glow, not a pixel.
- **Alert is the whole object turning red**, not a status LED in a corner. Same for amber and blue fills.
- Off is unlit frost: the object, not a gadget brick.
- Matte or satin, fingerprint-tolerant. Kitchen.
- No screen, no logo farm. No eyes or wing grooves on the canonical fridge mold.
- Front is seamless. Sensors and charge pads live on the **back and edge labyrinth**.

A person should understand it from across the kitchen: dark = fine, red = window.

## Two mounts, one bead

The electronics never change. A **sled** changes how it sits in the world.

```
        [ translucent bead ]
                 |
        back: charge pads + sensor labyrinth
                 |
     ------------+------------
     |                       |
 [ magnet sled ]      [ wearable sled ]
  fridge / steel        clip / loop / lanyard
  or adhesive foot
```

### Fridge sled

- **N52 disc magnet** in a thin polymer carrier that clicks onto the back (bayonet or magnets-to-steel inserts in the bead).
- Pull force: enough for a painted fridge door, including a slam. Test on cheap rental fridges, not only on a thick professional door.
- Keep the magnet from permanently latching to the LRA or confusing the Hall sensor — geometry and a bit of distance.
- Alternate foot: **adhesive** (3M VHB / Command) for glass, tile, wood, non-steel doors. Same snap interface.
- Placement guidance (in docs, not on the object): side of the fridge or upper door, **not** beside the steam of a kettle, **not** behind the oven handle’s hottest plume, **not** inside a cabinet.

Kitchen physics to design for:

- Grease film on everything. Sensor membrane wants a drip edge and a wipeable back.
- Splash from the sink. IPX4 as a *goal*; IP67 is in tension with gas access.
- Steel door = haptic sounding board. Fridge mode can use that; wearable mode cannot.

### Wearable sled

The personal object is now a **wristband** first (same Rams bird, smaller). Apron clip / loop remain optional sleds.

Options, in likely order:

1. **Slim wristband** — 10–12 mm pale sand strap; bird as a pebble charm. See below.
2. **Silicone loop** through a bar — necklace / bag charm.
3. **Clip** — apron, jeans, bag strap. Kitchen-wearable sibling.
4. **Pin / magnetic clasp** — two-piece, if we want no hole in the shell.

The Hall / reed switch: magnet sled present → fridge profile. Wrist / clip sled → wearable profile.

## Wristband (smaller personal home)

Fridge stills stay the locked 25–32 mm Rams mold (`hardware/renders/canonical/kanarin-fridge-{off,idle,blue,alert}.png`). Wrist is **not** that bead taped to a strap. Wrist is the same silhouette, scaled down, because it sits 30 cm from the eyes instead of 4 m across a kitchen.

Studies (do not overwrite canonical fridge): `hardware/renders/kanarin-wristband-{off,idle,alert}.png`.

### Why it can be smaller

| | Fridge bead | Wrist charm |
| --- | --- | --- |
| Read distance | ~4 m | ~0.3 m |
| Beak-to-tail | 25–32 mm | **18–22 mm** |
| Proud of the mount | 10–14 mm | **7–9 mm** |
| Band | — | 10–12 mm pale sand / bone |
| Cell | Inside the bird (80–200 mAh) | **Along the clasp / strap** (40–80 mAh pouch) |
| Haptic | Must shake painted steel | Couples into skin — the LRA’s best job |

The other chat’s **13 × 25 × 10 mm laser PCB pin** is a different object. It cannot hold STCC4 + SGP41 + nRF + Ø8 mm LRA + a real cell, and it is not the Rams bird. Do not mix those stills into this form.

### Split stack (how the charm stays small)

The Ø8 × 3.2 mm LRA plus a pouch cell already eat a 10 mm thickness budget. To shrink the bird without a rejected stem:

```
dorsal:  ePTFE / labyrinth  (air, not sweat)
         STCC4 + SHT40 + SGP41
         LED into frost shell
         nRF + DRV2605L
         Ø8 LRA  (against the strap, toward the wrist)
ventral: hidden bar / two-screw plate on the strap
flex →  pouch cell in the buckle or a 12 mm clasp pod
```

Sensors face **out**. Skin heat and sweat will lie to SHT40 and film the VOC port if the membrane is on the wrist side.

Charge: pogo on the clasp, not a USB-C on the bird. Overnight dock can still be the fridge bead’s sibling — a small tray the band sits in.

### One-shot rubber (band *is* the bird)

Charm-on-strap stills stay: `kanarin-wristband-{off,idle,alert}.png`. Do not overwrite them.

A second construction: **one LSR / TPE shot**. The slim strap swells into the Rams canary (tiny tangent beak, plump oval, short tail) and tapers back. No second part, no glue line, no clip. The PCB sits inside the thicker bird island; LEDs light **through** that volume only. The thin strap stays dark.

Studies: `hardware/renders/kanarin-wristband-oneshot-{off,idle,alert}.png` and `kanarin-wristband-oneshot-worn-{idle,alert}.png`.

The glow *is* the silhouette. Off, you read a molded bump in the same frost rubber. On, only the bird thickness carries amber or red.

This is friendlier to a pouch cell in the clasp: the bird island only has to hold LED, sensors, nRF, and the LRA.

Plump oneshot stills stay. A third pass **flattens** that island to the canonical fridge relief (`hardware/renders/canonical/kanarin-fridge-alert.png`): a cookie-profile cameo, a few millimeters proud of the strap, not a round figurine. Same Rams outline, same one-piece rubber, PCB still lights through the bird.

Studies: `hardware/renders/kanarin-wristband-flat-{off,idle,alert}.png`, `kanarin-wristband-flat-alert-top.png`, `kanarin-wristband-flat-worn-alert.png`.

### What “nice” means here

- Same frost polymer, tiny tangent beak, short tail, no eyes, no grooves.
- Light is still the only UI: off / amber idle / red alert. Blue remains an open product question.
- Strap is bone / sand, not black sport silicone. Jewelry, not a tracker.
- No spring bars showing, no lugs, no PCB window.
- Charm studies: bird sits *on* the strap like a stone. Oneshot studies: bird *is* a swell in the strap.

### Skin (new, for this home only)

Fridge and apron clip never touch skin. Wrist does.

- Hypoallergenic strap (medical silicone or vegetable leather).
- Membrane on the **outer** face; drip edge so wash water doesn’t sit on the port.
- IPX4 as a goal (sink, rain, sweat). IP67 still fights gas access.
- Night: dimmer LED, haptic is the signal. Wrist is in bed with the person.

### What we will prototype on a wrist

1. 18 / 20 / 22 mm resin birds on a 10 mm strap — which still reads as the fridge canary.
2. LRA under the bird vs under the clasp — which phrase is distinct without buzzing the whole arm.
3. Sensor port on the crown vs the flank — occlusion by sleeves.
4. All-day sweat + cooking evening — does the membrane still see VOC.

## Internal stack (section, conceptual)

Front to back, roughly:

1. Translucent outer shell
2. Inner diffuser / tint
3. RGB LED(s) firing into the diffuser
4. Round PCB: nRF, STCC4, SHT40, SGP41, DRV2605L
5. LiPo pouch nest
6. LRA in a pocket, foam-isolated, mechanically coupled to the back so fridge buzz transmits
7. Sensor labyrinth / ePTFE to the rim
8. Charge pads
9. Sled interface

STCC4 and SGP41 want still-enough air, not a sealed jewel. A **labyrinth at the rim** (hidden when on a fridge, open when worn) is the industrial-design problem of the project.

## Color and light in the object

- Idle: almost nothing. A 1% amber blip is a heartbeat, not a night light.
- Caution: the stone warms.
- Alert: the stone is red. Saturated. Visible at 4 m in a kitchen.
- Do not use green-for-good. Green “all clear” gadgets train people to stare. Kanarin’s all-clear is invisibility.

## Manufacturing sketch (later)

- Two-shot or translucent ABS / PC shell + TPE sleds.
- Ultrasonic weld or hidden screws from the sled face (service the cell).
- First articles: resin print + dyed diffuser, hand-soldered PCB, off-the-shelf magnet.

## Human factors

| Moment | What should happen |
| --- | --- |
| Cooking, bead on fridge | VOC patience; don’t scream at the first onion. Escalate if the room stays heavy. |
| Dinner, four people, windows shut | CO₂ phrase after persistence. Someone at the fridge sees red. |
| Worn on an apron | Soft `cook` ticks; cook can crack a window without walking to the fridge. |
| Night, bead in a bedroom (stretch goal) | Dim; haptic only if worn. Fridge bead in a kitchen at 2 a.m. can glow; nobody is there. |
| Guests ask “what is that” | “It turns red when we should air the room.” One sentence. |

Snooze must be obvious once hardware exists: tap the face, or seat it on the dock. A tiny object with no button will otherwise get thrown in a drawer.

## What we will prototype in physical space

1. **Wooden or clay beads** in 25 / 28 / 32 mm — which disappears on a fridge? which looks like jewelry?
2. **Glow tests** — LED in dyed resin, red vs amber, on a white fridge and a dark fridge.
3. **Magnet pull** — painted steel, stainless (many “stainless” doors are not magnetic), glass door with adhesive.
4. **Wear** — clip on apron vs loop on neck vs pocket. Haptic phrases on skin vs on denim vs on steel.
5. **Grease** — cook for a week with a dummy labyrinth; see what films over.

Until those five exist, the CAD is fiction.

## Open form questions

- Hole vs fully closed shell with a hidden rim vent.
- Removable sled vs a magnet always inside and a clip that covers it.
- Whether “bead” is round or a flattened oval (better fridge sit, worse necklace).
- Color: canary-yellow is on-theme and also a bit toy-like. Bone / smoke may age better.
- A kitchen-only sibling that is a fatter puck with USB-C and no wearable pretensions.
- Whether the wrist bird is a unique smaller mold or the fridge bird on a thicker strap (studies say unique smaller).
