extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Static.play("Static")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game_mouse_entered() -> void:
	$Set.show()

func _on_new_game_mouse_exited() -> void:
	$Set.hide()

func _on_continue_mouse_entered() -> void:
	$Set2.show()

func _on_continue_mouse_exited() -> void:
	$Set2.hide()

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/load_menu.tscn")

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/load_menu.tscn")

func _on_timer_timeout() -> void:
	$Animations.play("Movement")
