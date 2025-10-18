extends CharacterBody2D

enum States {IDLE, CHASING, ATTACKING, FIGHTING, DEATH}
var state: States = States.IDLE

var speed = 3
var player_in_detection_range = false
var player = null
signal fight 

	
func _physics_process(_delta):
	if state == States.IDLE:
		idle()
	elif state == States.CHASING:
		chasing()
	elif state == States.ATTACKING:
		attacking()
	elif state == States.FIGHTING:
		fighting()

	
func idle():
	if player_in_detection_range:
			state = States.CHASING
			
func chasing():
	if !player_in_detection_range:
			state = States.IDLE
			print("Detection area exited!")	
	else:
		# chase speed is still not realistic
		position += (player.position - position).normalized() * speed
		var dx = player.position.x - position.x
		var dy = player.position.y - position.y
		var distance = sqrt(dx*dx + dy*dy)
		if distance < 50:
			state = States.ATTACKING
			
func attacking():
	print("Attacking")
	state = States.FIGHTING
	# after playing ATTACKING animation transition to FIGHTING

func fighting():
	emit_signal("fight")
	
func death():
	pass
			
func _on_detection_area_body_entered(body):
	player = body
	player_in_detection_range = true
	
func _on_detection_area_body_exited(_body):
	player = null
	player_in_detection_range = false
