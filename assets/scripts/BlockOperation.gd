extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        body.set_value(body.value * 1)
