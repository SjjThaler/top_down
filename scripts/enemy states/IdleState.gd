# IdleState.gd
class_name IdleState
extends State

func enter():
	print("Entering IDLE")
	
func physics_process(_delta):
	if character.player_in_detection_range:
		state_machine.change_state("chasing")
