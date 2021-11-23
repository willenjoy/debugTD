extends BlockActiveBase


var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    speed = level_controller().speed


func reset():
    pass


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        # true -> right, false -> left
        var condition = inner.call_func(body.value)
        if condition:
            body.set_velocity(Vector2(speed, 0))
        else:
            body.set_velocity(Vector2(-speed, 0))
        body.set_is_bug(condition != data[body.index])
        # body.position = position
