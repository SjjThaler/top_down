# StateMachine.gd (attach to CharacterBody2D as child node)
extends Node

@export var initial_state = "idle"
var current_state: State
var states = {}
var character

func _ready():
	character = get_parent()
	
	# Create all state instances
	var idle = IdleState.new()
	var chasing = ChasingState.new()
	var attacking = AttackingState.new()
	
	# Setup each state
	for state in [idle, chasing, attacking]:
		state.state_machine = self
		state.character = character
		add_child(state)
		states[state.get_class().to_lower()] = state
	
	change_state(initial_state)

func _physics_process(delta):
	if current_state:
		current_state.physics_process(delta)

func _process(delta):
	if current_state:
		current_state.process(delta)

func change_state(state_name: String):
	if current_state:
		current_state.exit()
	
	current_state = states[state_name]
	if current_state:
		current_state.enter()
