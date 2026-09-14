extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered():
	get_parent().get_node("CharacterBody2D").get_node("Camera2D").get_node("Sprite2D").visible = false
	print("yes")
