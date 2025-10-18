# ChasingState.gd
class_name ChasingState
extends State

func enter():
	print("Entering CHASING")

func exit():
	pass

func physics_process(_delta):
	if !character.player_in_detection_range:
		state_machine.change_state("idle")
		return
	
	else:
		# chase speed is still not realistic
		character.position += (character.player.position - character.position).normalized() * character.speed
		var dx = character.player.position.x - character.position.x
		var dy = character.player.position.y - character.position.y
		var distance = sqrt(dx*dx + dy*dy)
		if distance < 50:
			state_machine.change_state("attacking")
