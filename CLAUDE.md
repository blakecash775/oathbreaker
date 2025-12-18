# CLAUDE.md

## Project Overview

Oathbreaker is a story-focused action roguelike built with Godot 4.5 (Mobile renderer). High-mobility, momentum-based combat. Early development.

**Main scene:** `Interface/TitleScreen/titlescreen.tscn` (loads prison.tscn on start)

## Project Structure

- **00_Globals/** - Autoloaded managers
- **Player/** - Player character, state machine, sprites
- **Enemies/** - Base enemy class, state machine, enemy types (Mulcher)
- **Interface/** - HUD, dialogue, pause menu, scene transitions, title screen
- **Zones/** - Level scenes (prison, forest) and zone helpers
- **UtilNodes/** - Reusable HitBox/HurtBox components
- **Tilemaps/** - Level geometry and tilesets
- **Weapons/** - Weapon sprites (ChainAxe - not yet implemented)

## Autoloads

- **ZoneManager** - Scene transitions with fade effects
- **Hud** - HP bar, dialogue caption system with portraits
- **PlayerManager** - Persistent player instance across zones
- **Scenetransition** - Fade in/out effects
- **Pause** - Pause menu overlay

## Core Systems

### State Machines
Player and enemies use the same pattern. States extend a base class, implement `enter()`, `exit()`, `process()`, `physics()`, `handle_input()`, and return new states to trigger transitions (or null to stay).

- **Player states:** Idle, Walk, Attack, Damaged
- **Enemy states:** Idle, Wander, Damaged, Dying

### Combat
Signal-based HitBox/HurtBox system. HurtBox emits `damaged` signal when overlapping a HitBox. Player and enemies have HP, invulnerability frames, and knockback on damage.

### Dialogue System
Centralized in `Interface/dialogue_data.gd`. Supports:
- Character portraits (Jailer One, Jailer Two)
- Conditional dialogue (matches zone, low_hp, etc.)
- Weighted random selection from multiple scripts
- Passive dialogue on timers for ambient NPC chatter

### Enemy Spawning
`Zones/ZoneHelpers/enemyspawn.tscn` spawns enemies at marker positions. Supports respawning after death with configurable delay (3-8s).

### Player Death
On death, reloads prison zone and resets player HP. Optional death dialogue.

### Zone Transitions
Player persists via PlayerManager. Zones reparent player on load. ZoneTransition areas handle moving between zones.

## Input Actions

- **Movement:** WASD / Arrows / Left Stick
- **Attack:** Left Mouse / Gamepad B
- **Pause:** Escape / Start

## Physics Layers

1. Player
2. PlayerHurt
5. Walls
9. Enemy
