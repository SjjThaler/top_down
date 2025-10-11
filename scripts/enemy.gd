extends CharacterBody2D

enum States {IDLE, CHASING, ATTACKING, FIGHTING, DEATH}
var state: States = States.IDLE

var speed = 25
var player_chase = false
var player = null

func _physics_process(_delta):
	if state == States.IDLE:
		pass
		# if detection_area_body_entered transition into CHASING
	if state == States.CHASING:
		pass
		# if distance to player > 2 transition into ATTACKING
	if state == States.ATTACKING:
		pass
		# after playing ATTACKING animation transition to FIGHTING
	if state == States.FIGHTING:
		pass
		# this is the mode in which we implement round-based fighting
		# when player defeated exit state and load player_death
		# when enemy defeated transition into DEATH
	if state == States.DEATH:
		pass
	
	if player_chase:
		position += (player.position - position) / speed

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false
