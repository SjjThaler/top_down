extends GutTest

var game_scene: Node2D
var background: TileMapLayer
var middleground: TileMapLayer
var foreground: TileMapLayer

func before_each():
	# Load your actual game scene
	game_scene = load("res://scenes/main.tscn").instantiate()
	add_child_autofree(game_scene)
	
	# Get the TileMaps from your scene
	background = game_scene.get_node("Background")
	middleground = game_scene.get_node("Middleground")
	foreground = game_scene.get_node("Foreground")

func test_middleground_tile_has_z_index_zero():
	"""
	Tests the z-index of the middleground tilemap-Layer. We don't need to test individual tiles 
	as they have their own z-index separate from the tilemap-layer's z-index. 
	Leaving the individual tile test in just to document this distinction.
	"""
	assert_eq(middleground.z_index, 0, "The Middleground-Layer's z-index should always be 0")

	#var tile_data = middleground.get_cell_tile_data(Vector2i(20, 6))
	#assert_eq(tile_data.z_index, 0, "Middleground tile should have z-index 0")

func test_foreground_tile_has_z_index_one():
	"""
	Test the z-index of the foreground tilemap-layer.
	"""
	assert_eq(foreground.z_index, 1, "The Foreground-Layer's z-index should always be 1")

func test_background_tile_has_z_index_minus_one():
	"""
	Tests the z-index of the background tilemap-layer.
	"""
	assert_eq(background.z_index, -1, "The Background-Layer's z-index should always be -1")
