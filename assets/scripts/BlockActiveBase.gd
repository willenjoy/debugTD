class_name BlockActiveBase
extends BlockBase

var inner : FuncRef

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.
    

func set_inner(new_inner):
    inner = new_inner
    print('Set new inner 1 -> %s' % inner.call_func(1))
