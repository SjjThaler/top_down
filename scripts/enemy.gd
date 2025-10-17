extends CharacterBody2D

enum States {IDLE, CHASING, ATTACKING, FIGHTING, DEATH}
var state: States = States.IDLE

var speed = 3
var player_in_detection_range = false
var player = null
signal fight 

	
func _physics_process(_delta):
	if state == States.IDLE:
		if player_in_detection_range:
			state = States.CHASING
	elif state == States.CHASING:
		
		if !player_in_detection_range:
			state = States.IDLE
			print("Detection area exited!")
			
		else:
			# chase speed is still not realistic
			position += (player.position - position).normalized() * speed
			var dx = player.position.x - position.x
			var dy = player.position.y - position.y
			var dis = sqrt(dx*dx + dy*dy)
			if dis < 50:
				state = States.ATTACKING
			
	elif state == States.ATTACKING:
		print("Attacking")
		state = States.FIGHTING
		# after playing ATTACKING animation transition to FIGHTING
	elif state == States.FIGHTING:
		emit_signal("fight")
		
	elif state == States.DEATH:
		pass	

func _on_detection_area_body_entered(body):
	player = body
	player_in_detection_range = true
func _on_detection_area_body_exited(_body):
	player = null
	player_in_detection_range = false
