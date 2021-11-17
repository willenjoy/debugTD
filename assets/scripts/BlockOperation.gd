extends BlockActiveBase

# Called when the node enters the scene tree for the first time.
func _ready():
    $Label.text = block_id
    $Label.visible = level_controller().debug


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        body.set_value(inner.call_func(body.value))
        body.set_is_bug(body.value != data[body.index])
