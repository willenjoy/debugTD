extends Node2D

export (Vector2) var direction = Vector2(0, 1)


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        body.linear_velocity = 200 * direction
