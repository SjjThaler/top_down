extends CanvasLayer

@onready var label = $Control/Label

func _ready():
	"""Note to myself: this signal setup was primarily done in order to detach the Player_Display
	from the Player-Node. By receiving a signal the Player_Display doesn't need to be
	imported into the player.gd script. As a consequence we also don't need to load,
	instantiate and add the Player_Display-node into the test_player.gd."""
	
	var player = get_node("../Player")
	player.input_changed.connect(_on_player_input_changed)

func _on_player_input_changed(input_vector):
	label.text = str(input_vector)
