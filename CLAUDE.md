# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Oathbreaker is a story-driven action roguelike game built with Godot 4.5 (Mobile renderer). The project is in early development with placeholder systems, but intends to have a strong focus on high mobity, momentum based combat.

## Running the Game

The main scene for this phase of testing is `playground.tscn`.

## Architecture

### Player State Machine

The player uses a state machine pattern located in `Player/Scripts/`:

- **state.gd**: Base `State` class that all states extend. Has a static `player` reference shared across states. States implement `Enter()`, `Exit()`, `Process()`, `Physics()`, and `HandleInput()` methods.
- **player_state_machine.gd**: `PlayerStateMachine` manages state transitions. Calls into current state for process/physics/input handling.
- **state_idle.gd**, **state_walk.gd**, **state_attack.gd**: Concrete state implementations.

State transitions return the new `State` (or `null` to stay). States reference siblings via `@onready var` with paths like `$"../Walk"`.

### Player (player.gd)

`Player` extends `CharacterBody2D`. Key properties:
- `cardinal_direction`: Current facing direction (Vector2)
- `direction`: Normalized input direction

`SetDirection()` updates cardinal direction from input. `UpdateAnimation()` plays animations based on state and direction.

### Input Actions

Defined in `project.godot`: `up`, `down`, `left`, `right` (WASD/arrows/gamepad), `attack` (left click/gamepad B).

### Physics Layers

- Layer 1: Player
- Layer 5: Walls
