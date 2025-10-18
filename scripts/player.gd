extends CharacterBody2D
var speed = 400
# Send the input coordinates through a signal so that the player node
# is independent from the Player_Display node. This allows us to test
# the player node without getting the canvas node. 
signal input_changed(input_vector)

enum States {MOVE, FIGHTING}
var state: States = States.MOVE

func _ready():
	var enemy = get_node("../enemy")
	enemy.fight.connect(_on_fight)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	input_changed.emit(input_direction)
	
func _physics_process(_delta):
	if state == States.MOVE:
		move()
	elif state == States.FIGHTING:
		fighting()
	
func move():
	get_input()
	move_and_slide()

func fighting():
	pass
func _on_fight():
	state = States.FIGHTING
	print("Player fighting!")
		
