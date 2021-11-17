extends BlockActiveBase

# Called when the node enters the scene tree for the first time.
func _ready():
    if level_controller().debug:
        $Label.text = block_id


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        body.set_value(inner.call_func(body.value))
