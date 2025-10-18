# IdleState.gd
class_name FightingState
extends State

func enter():
	print("Entering Fighting")

func physics_process(_delta):
	character.emit_signal("fight")
	
