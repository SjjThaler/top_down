extends GutTest

var enemy
var player

func before_each():
	# Load and instantiate the enemy scene
	var enemy_scene = load("res://scenes/enemy.tscn")
	enemy = autofree(enemy_scene.instantiate())
	add_child(enemy)
	
	#Load and instantiate the player scene
	var player_scene = load("res://scenes/player.tscn")
	player = autofree(player_scene.instantiate())
	add_child(player)
	

func test_on_detection_area_body_entered():
	# Mock body entered signal for detection_area
	var detection_area = enemy.get_node("detection_area")
	detection_area.emit_signal("body_entered", player)
	
	# Call the on _on_detection_area_body_entered method
	#enemy._on_detection_area_body_entered()
	# => not necessary as signals call their functions automatically when they are emitted
	
	assert_eq(enemy.player, player, "Player references should be set")
	assert_eq(enemy.player_chase, true, "Player_chase should be true when a body enters the detection area")
	
func test_on_detection_area_body_exited():
	# Setup: enemy is already chasing player
	enemy.player = player
	enemy.player_chase = true
	
	var detection_area = enemy.get_node("detection_area")
	detection_area.emit_signal("body_exited", player)
	
	assert_null(enemy.player, "Player reference should be cleared")
	assert_eq(enemy.player_chase, false, "Player_chase should be false when player exits")
