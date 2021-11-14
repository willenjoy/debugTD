extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func condition(value):
    return value % 2 == 0


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        # true -> right, false -> left
        if condition(body.value):
            body.linear_velocity = Vector2(200, 0)
        else:
            body.linear_velocity = Vector2(-200, 0)    
