extends BlockActiveBase

export (bool) var debug = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass


func reset():
    pass


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        var new_value = inner.call_func(body.value)
        body.set_value(new_value)
        if debug:
            print('%s - set value %d for data unit %d' % [block_id, new_value, body.index])
        body.set_is_bug(body.value != data[body.index])
