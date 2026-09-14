extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (1 == 1):
		pass

func _on_area_2d_body_entered(body):
	get_node("CharacterBody2D/Camera2D/Sprite2D").Visible = false
	print("asdfsdf")
