# CLAUDE.md

## Project Overview

Oathbreaker is a story-focused action roguelike built with Godot 4.5 (Mobile renderer). The game focuses on high-mobility, momentum-based combat. Currently in early development.

## Running the Game

Main scene: `Zones/prison.tscn`

## Project Structure

- **00_Globals/** - Autoloaded managers (ZoneManager, PlayerManager)
- **Player/** - Player character, state machine, sprites
- **Zones/** - Level scenes and zone helper components
- **Enemies/** - Enemy types (Dummy, Mulcher) and base enemy class
- **Interface/** - HUD, dialogue captions, scene transitions
- **UtilNodes/** - Reusable hitbox/hurtbox components
- **Tilemaps/** - Level geometry and tilesets

## Key Systems

### Autoloads
- **ZoneManager** - Orchestrates scene transitions with fade effects
- **PlayerManager** - Manages persistent player instance across zones
- **Hud** - Persistent UI layer with dialogue caption system
- **Scenetransition** - Fade in/out effects

### Player State Machine
Located in `Player/Scripts/`. States extend `state.gd` base class with shared static player reference. States implement `Enter()`, `Exit()`, `Process()`, `Physics()`, `HandleInput()` and return new states to trigger transitions (or null to stay).

### Combat
Signal-based system using HitBox/HurtBox components in `UtilNodes/`. HurtBox emits `Damaged` signal when hit.

### Zone Transitions
Player persists across scenes via PlayerManager. Zones reparent the player on load. ZoneTransition triggers handle moving between areas.

## Input Actions

- **Movement:** WASD/Arrows/Gamepad (up, down, left, right)
- **Attack:** Left Mouse/Gamepad B

## Physics Layers

- Layer 1: Player
- Layer 2: PlayerHurt
- Layer 5: Walls
- Layer 9: Enemy
