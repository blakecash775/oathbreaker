# CLAUDE.md

## Project Overview

Oathbreaker is a story-focused action roguelike built with Godot 4.5 (Mobile renderer). High-mobility, momentum-based combat. Early development.

**Main scene:** `Zones/prison.tscn`

## Project Structure

- **00_Globals/** - Autoloaded managers (ZoneManager, PlayerManager)
- **Player/** - Player character, state machine, sprites
- **Enemies/** - Base enemy class, state machine, enemy types (Mulcher)
- **Interface/** - HUD (HP bar, dialogue captions), pause menu, scene transitions
- **Zones/** - Level scenes and zone helper components (transitions, spawns)
- **UtilNodes/** - Reusable HitBox/HurtBox components
- **Tilemaps/** - Level geometry and tilesets

## Autoloads

- **ZoneManager** - Scene transitions with fade effects, stores transition target info
- **PlayerManager** - Persistent player instance across zones
- **Hud** - HP bar, dialogue caption system with character portraits
- **Scenetransition** - Fade in/out effects
- **Pause** - Pause menu overlay

## Core Systems

### State Machines
Both player and enemies use the same state machine pattern. States extend a base class, implement `Enter()`, `Exit()`, `Process()`, `Physics()`, `HandleInput()`, and return new states to trigger transitions (or null to stay).

- **Player states:** Idle, Walk, Attack, Damaged
- **Enemy states:** Idle, Wander, Damaged, Dying

### Combat
Signal-based HitBox/HurtBox system. HurtBox emits `Damaged` signal when overlapping a HitBox. Player and enemies have HP, invulnerability frames, and knockback on damage.

### Direction System
Dual direction tracking: `direction` for movement input, `aim_direction` for mouse cursor. `cardinal_direction` determines sprite facing and hitbox rotation via `PlayerInteractionsHost`.

### Zone Transitions
Player persists via PlayerManager. Zones reparent player on load. ZoneTransition triggers handle moving between areas.

## Input Actions

- **Movement:** WASD / Arrows / Left Stick
- **Attack:** Left Mouse / Gamepad B
- **Pause:** Escape / Start

## Physics Layers

1. Player
2. PlayerHurt
5. Walls
9. Enemy
