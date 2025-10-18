extends CharacterBody2D

enum States {IDLE, CHASING, ATTACKING, FIGHTING, DEATH}

var speed = 3
var player_in_detection_range = false
var player = null
signal fight
			
func _on_detection_area_body_entered(body):
	player = body
	player_in_detection_range = true
	
func _on_detection_area_body_exited(_body):
	player = null
	player_in_detection_range = false
