extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _on_Button_mouse_entered():
    $Sprite.visible = true


func _on_Button_mouse_exited():
    $Sprite.visible = false
