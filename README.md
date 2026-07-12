# DndCoin

A reusable OpenSCAD framework for creating D&D style coins, medallions, challenge coins, and tokens.

## Architecture

- `Core/` — generic, reusable primitives. Not coin-specific. (`CoinBody`, `CoinBorder`, `Ring`, `RadialArm`, `DiamondMarker`, `ArcText`)
- `Faces/` — the parts and pieces that make up a specific coin's artwork, built from `Core/` primitives. (e.g. `AetharriaSigil`)
- `Sides/` — finished, working coin sides, assembled from `Core/` + `Faces/` pieces. These are what actually get rendered. (e.g. `BlankSide`, `AetharriaSigilSide`)

**Naming convention:** finished sides in `Sides/` follow `<CoinName><Descriptor>Side.scad` (e.g. `AetharriaSigilSide.scad`).

## Current Features

- Coin Base
- Raised Border
- Arc Text
- Ring (generic annulus/ring primitive)
- Radial Arm (straight spoke from coin center)
- Diamond Marker (a kite/rhombus/diamond, hollow or solid)

See `Faces/AetharriaSigil.scad` for an example combining these into a finished piece of coin art.

## Planned

- Rune Rings
- Center Art helpers
- Additional reusable `Sides/`/`Faces/` components as new coins demonstrate the need
- SVG-based artwork import (`SvgArt()`) — parked for now; OpenSCAD's SVG importer can't cleanly reproduce stroke-based artwork (closed shapes always import as solid fills), so native primitive reconstruction is the preferred approach until a design genuinely requires importing external art
