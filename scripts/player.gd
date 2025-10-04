extends CharacterBody2D
var speed = 400
@onready var label: Label = $"../CanvasLayer/Control/Label"
var input_label

func a_string():
	return "hey!"

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	input_label = input_direction
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	label.text = str(input_label)
