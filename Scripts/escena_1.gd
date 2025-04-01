extends Node2D

var left: bool = false
var right: bool = false

var leftDoor: bool = false
var rightDoor: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Audio/Call.play()
	$Audio/Ambience.play()
	$Animations/Fan.play("default")
	$Buttons/LeftAnimation.play("off")
	$Buttons/RightAnimation.play("off")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_camera(left, right)
	
func move_camera(left:bool, right:bool):
	if left && $Camera.position.x > -395:
		$Camera.position.x -= 20
	if right && $Camera.position.x < 352:
		$Camera.position.x += 20

func _on_area_2d_left_mouse_entered() -> void:
	left = true

func _on_area_2d_left_mouse_exited() -> void:
	left = false

func _on_area_2d_right_mouse_entered() -> void:
	right = true

func _on_area_2d_right_mouse_exited() -> void:
	right = false

func _on_left_pressed() -> void:
	$Audio/Door.play()
	if not leftDoor:
		$Buttons/LeftAnimation.play("on")
		$Animations/LeftDoor.play_backwards("default")
		leftDoor = true
	else:
		$Buttons/LeftAnimation.play("off")
		$Animations/LeftDoor.play("default")
		leftDoor = false

func _on_right_pressed() -> void:
	$Audio/Door.play()
	if not rightDoor:
		$Buttons/RightAnimation.play("on")		
		$Animations/RightDoor.play_backwards("default")
		rightDoor = true
	else:
		$Buttons/RightAnimation.play("off")
		$Animations/RightDoor.play("default")		
		rightDoor = false
