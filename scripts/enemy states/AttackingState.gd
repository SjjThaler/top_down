# AttackingState.gd
class_name AttackingState
extends State

func enter():
	print("Entering ATTACKING")

func physics_process(_delta):
	state_machine.change_state("fighting")
