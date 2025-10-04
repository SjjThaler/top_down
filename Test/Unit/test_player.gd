extends GutTest

var player

func before_each():
	# Load and instantiate the player scene
	var player_scene = load("res://scenes/player.tscn")
	player = autofree(player_scene.instantiate())
	add_child(player)

func test_left_input():
	# Simulate pressing the "left" action
	Input.action_press("left")
	
	# Call get_input to process the input
	player.get_input()
	
	# Assert that velocity.x is negative (moving left)
	assert_lt(player.velocity.x, 0, "Velocity should be negative when moving left")
	assert_eq(player.velocity.x, -player.speed, "Velocity should equal -speed when moving left")
	
	# Clean up - release the action
	Input.action_release("left")

func after_each():
	# Make sure all inputs are released after each test
	Input.action_release("left")
	Input.action_release("right")
	Input.action_release("up")
	Input.action_release("down")
