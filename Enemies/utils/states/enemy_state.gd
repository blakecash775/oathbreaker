class_name EnemyState extends Node

## Stores a reference to the enemy that this state belongs to
var enemy: Enemy
var state_machine: EnemyStateMachine

# What happens when we initialize this state?
func init()-> void:
	pass
	
# What happens when the enemy enters this state?
func Enter() -> void:
	pass

# What happens when the enemy exits this state?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> EnemyState:
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> EnemyState:
	return null
