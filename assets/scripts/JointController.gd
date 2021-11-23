extends Node2D

export (Vector2) var direction = Vector2(0, 1)
var speed = 0

func _ready():
    speed = get_node('../../LevelController').speed
    

func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        body.set_velocity(speed * direction)
        # body.position = position
