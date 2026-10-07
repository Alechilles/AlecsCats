"""Builds the Cat Playhouse prefab, a set for filming cats with the cat furniture and toys.

Run from the repo root:
    python scripts/tools/prefabs/build-cat-playhouse.py

Axes: x runs left to right, z runs from the back wall (-z) to the yard (+z), y is up.
The floor and the ground are layer y = 0, which is also the anchor layer.

Rotation of roofs, stairs, wall-mounted blocks and furniture (measured on vanilla prefabs):
0 = back toward -z, 1 = back toward -x, 2 = back toward +z, 3 = back toward +x.
Multi-cell cat furniture stays at rotation 0 so its filler cells match the hitbox files.
"""

import json
from pathlib import Path

OUT = Path("Server/Prefabs/AlecsCats/Cat_Playhouse/AlecsCats_Cat_Playhouse_001.prefab.json")

PLANKS = "Wood_Softwood_Planks"
BEAM = "Wood_Softwood_Beam"
ROOF = "Wood_Softwood_Roof"
RIDGE = "*Wood_Softwood_Roof_State_Definitions_Topper"
COBBLE = "Rock_Stone_Cobble"
FENCE = "Wood_Softwood_Fence"
FENCE_CORNER = "*Wood_Softwood_Fence_State_Definitions_Corner"

blocks = {}
fluids = []


def put(x, y, z, name, rotation=0, filler=0, support=0, components=None):
    entry = {"x": x, "y": y, "z": z, "name": name}
    if rotation:
        entry["rotation"] = rotation
    if filler:
        entry["filler"] = filler
    if support:
        entry["support"] = support
    if components:
        entry["components"] = {"Components": components}
    blocks[(x, y, z)] = entry


def put_multi(x, y, z, name, size):
    """Places a rotation 0 multi-cell block: the base cell plus its filler cells."""
    sx, sy, sz = size
    for dx in range(sx):
        for dy in range(sy):
            for dz in range(sz):
                put(x + dx, y + dy, z + dz, name, filler=dx | dz << 5 | dy << 10)


# House: interior x 0..10, z 0..4. Walls at x = -1, x = 11 and z = -1. The front (z = 5) is open.
X0, X1, Z0, Z1 = -1, 11, -1, 5
WALL_TOP = 4

# Ground plate with cut corners, and a foundation that tapers below it.
PX0, PX1, PZ0, PZ1 = -5, 15, -4, 15


def in_plate(x, z, shrink=0):
    x0, x1, z0, z1 = PX0 + shrink, PX1 - shrink, PZ0 + shrink, PZ1 - shrink
    if not (x0 <= x <= x1 and z0 <= z <= z1):
        return False
    corner = min(x - x0, x1 - x) + min(z - z0, z1 - z)
    return corner >= 2


for x in range(PX0, PX1 + 1):
    for z in range(PZ0, PZ1 + 1):
        if in_plate(x, z):
            put(x, 0, z, "Soil_Grass")
            put(x, -1, z, "Soil_Dirt")
            put(x, -2, z, "Soil_Dirt")
        if in_plate(x, z, 1):
            put(x, -3, z, "Rock_Stone")
        if in_plate(x, z, 2):
            put(x, -4, z, "Rock_Stone")

# Floor: cobble under the walls, planks inside and on the porch (z 5..7).
for x in range(X0, X1 + 1):
    for z in range(Z0, 8):
        on_wall = x in (X0, X1) and z <= Z1 or z == Z0
        put(x, 0, z, COBBLE if on_wall else PLANKS)

# Rug set flush into the floor.
for x in range(3, 8):
    for z in range(1, 4):
        edge = x in (3, 7) or z in (1, 3)
        put(x, 0, z, "Cloth_Block_Wool_Pink_Light" if edge else "Cloth_Block_Wool_White")

# Garden path from the porch to the gate.
for z in range(8, PZ1 + 1):
    put(5, 0, z, "Soil_Pathway")
for x, z in ((4, 9), (6, 11), (4, 13), (6, 14)):
    put(x, 0, z, "Soil_Pathway")


# Roof height above each z row. The ridge runs along x at z = 2.
def roof_y(z):
    return WALL_TOP + 4 - abs(z - 2)


# Walls: a cobble base course, planks above, beams at the corners, gables up to the roof.
def wall_block(y):
    return COBBLE if y == 1 else PLANKS


for z in range(Z0, Z1 + 1):
    for x in (X0, X1):
        corner = z in (Z0, Z1)
        for y in range(1, roof_y(z)):
            if corner and y <= WALL_TOP:
                put(x, y, z, BEAM)
            else:
                put(x, y, z, wall_block(y))
for x in range(X0 + 1, X1):
    for y in range(1, WALL_TOP + 1):
        put(x, y, Z0, wall_block(y))
    put(x, WALL_TOP, Z1, BEAM, rotation=5)

# Windows: three wide in the back wall, one in each side wall.
for y in (2, 3):
    for x in (4, 5, 6):
        put(x, y, Z0, "Furniture_Village_Window")
    for x in (X0, X1):
        put(x, y, 2, "Furniture_Village_Window", rotation=1)

# Roof with one block of overhang on every side.
for x in range(X0 - 1, X1 + 2):
    for z in range(Z0 - 1, Z1 + 2):
        if z == 2:
            put(x, roof_y(z), z, RIDGE)
        else:
            put(x, roof_y(z), z, ROOF, rotation=2 if z < 2 else 0)

# Carve the room, the porch and the air over the garden.
for x in range(PX0, PX1 + 1):
    for z in range(PZ0, PZ1 + 1):
        if not in_plate(x, z):
            continue
        inside = X0 - 1 <= x <= X1 + 1 and Z0 - 1 <= z <= Z1 + 1
        top = roof_y(z) - 1 if inside else 4
        for y in range(1, top + 1):
            if (x, y, z) not in blocks:
                put(x, y, z, "Empty")

# Cat furniture and toys inside.
put_multi(1, 1, 0, "Cat_Tower", (2, 2, 1))
put_multi(8, 1, 1, "Cat_Scratching_Post", (1, 2, 1))
put(4, 1, 0, "Cat_Bed")
put(10, 1, 4, "Cat_Bed", rotation=3)
put(10, 1, 1, "Cat_Bowl", rotation=3)
put(10, 1, 2, "Cat_Bowl", rotation=3)
put(0, 1, 2, "Cat_Box", rotation=1)

# Prop chest with the toys and supplies for a shoot.
supplies = [
    ("Cat_Yarn_Ball", 1),
    ("Cat_Yarn_Ball", 1),
    ("Cat_Yarn_Ball", 1),
    ("Cat_Teaser_Toy", 1),
    ("AlecsCats_Command_Item", 1),
    ("Food_Fish_Raw", 20),
    ("Container_Bucket", 1),
]
items = {
    str(slot): {
        "Id": item_id,
        "Quantity": quantity,
        "Durability": 0.0,
        "MaxDurability": 0.0,
        "OverrideDroppedItemAnimation": False,
    }
    for slot, (item_id, quantity) in enumerate(supplies)
}
put(0, 1, 4, "Furniture_Village_Chest_Small", rotation=1, components={
    "ItemContainerBlock": {
        "ItemContainer": {"Id": "Simple", "Capacity": 18, "Items": items},
        "Capacity": 18,
    }
})

# Decoration inside.
put(0, 1, 0, "Deco_Lantern")
put(10, 1, 0, "Deco_Lantern")
put(7, 1, 0, "Deco_Kweebec_Plush")
put(9, 1, 0, "Deco_Book_Pile_Small")
put(8, 3, 0, "Furniture_Village_Shelf_Full")
put(9, 3, 0, "Furniture_Village_Shelf_Full")
put(0, 3, 1, "Furniture_Village_Painting_1x1", rotation=1)

# Porch.
put(0, 1, 6, "Cat_Bed")
put(-1, 1, 7, "Deco_Lantern")
put(11, 1, 7, "Deco_Lantern")
put(10, 1, 6, "Furniture_Village_Pot")

# Garden fence along both sides and the front, with a gate gap on the path.
FX0, FX1, FZ = -3, 13, 14
for z in range(6, FZ):
    put(FX0, 1, z, FENCE, rotation=1)
    put(FX1, 1, z, FENCE, rotation=1)
for x in range(FX0 + 1, FX1):
    if x not in (4, 5, 6):
        put(x, 1, FZ, FENCE)
put(FX0, 1, FZ, FENCE_CORNER, rotation=2)
put(FX1, 1, FZ, FENCE_CORNER, rotation=3)

# Garden: a second scratching post, the large box, a pond, catnip and flowers.
put_multi(9, 1, 10, "Cat_Scratching_Post", (1, 2, 1))
put_multi(11, 1, 9, "Cat_Box2", (1, 1, 2))
for x in (0, 1):
    for z in (10, 11):
        put(x, 0, z, "Empty")
        fluids.append({"x": x, "y": 0, "z": z, "name": "Water_Source", "level": 1})
for x, z in ((-1, 10), (2, 11), (0, 12), (1, 9)):
    put(x, 0, z, "Soil_Gravel")
for x, z in ((-2, 12), (-1, 12), (-2, 13), (-1, 13), (0, 13), (-2, 11)):
    put(x, 1, z, "Plant_Flower_Catnip")
flowers = {
    (2, 9): "Plant_Flower_Common_Pink", (3, 12): "Plant_Flower_Common_Yellow",
    (7, 13): "Plant_Flower_Common_White", (8, 12): "Plant_Flower_Common_Pink",
    (12, 13): "Plant_Flower_Common_Yellow", (12, 12): "Plant_Flower_Common_Violet",
    (10, 13): "Plant_Flower_Common_Blue", (7, 9): "Plant_Flower_Common_White",
    (-2, 8): "Plant_Flower_Common_Violet", (12, 7): "Plant_Flower_Common_Pink",
}
for (x, z), name in flowers.items():
    put(x, 1, z, name)

# Planting around the outside of the house and the fence.
outside = {
    (-3, 0): "Plant_Bush_Green", (-3, 3): "Plant_Flower_Common_Pink",
    (13, 1): "Plant_Bush_Green", (13, 4): "Plant_Flower_Common_Yellow",
    (2, -3): "Plant_Bush_Green", (8, -3): "Plant_Bush_Green",
    (-4, 6): "Plant_Grass_Sharp", (-4, 11): "Plant_Grass_Sharp", (14, 9): "Plant_Grass_Sharp",
    (14, 3): "Plant_Grass_Sharp", (5, -3): "Plant_Grass_Sharp", (-2, -3): "Plant_Grass_Sharp",
    (3, 15): "Plant_Grass_Sharp", (9, 15): "Plant_Grass_Sharp", (12, -2): "Plant_Grass_Sharp",
}
for (x, z), name in outside.items():
    put(x, 1, z, name)

# Vines on the outer walls: back wall (solid at +z) and right wall (solid at -x).
for x, ys in ((0, (2, 3)), (9, (1, 2, 3)), (10, (3,))):
    for y in ys:
        put(x, y, Z0 - 1, "Plant_Vine_Wall", rotation=2)
for z, ys in ((0, (2, 3)), (4, (3,))):
    for y in ys:
        put(X1 + 1, y, z, "Plant_Vine_Wall", rotation=1)

prefab = {
    "version": 8,
    "blockIdVersion": 11,
    "anchorX": 5,
    "anchorY": 0,
    "anchorZ": 5,
    "blocks": [blocks[key] for key in sorted(blocks, key=lambda k: (k[0], k[2], k[1]))],
    "fluids": fluids,
}
OUT.parent.mkdir(parents=True, exist_ok=True)
OUT.write_text(json.dumps(prefab, indent=2) + "\n", encoding="utf-8")
print(f"Wrote {OUT} with {len(blocks)} blocks")
