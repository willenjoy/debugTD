class_name LevelController
extends Node


var debug = true
var input_data = [1, 2, 3, 4, 5]
var output_data = [2, 1, 6, 3, 10]


func bo1(value):
    return value
    
    
func bo_left(value):
    return value * 2
    

func bo_right(value):
    return value - 1


func bc(value):
    return value % 2 == 0


var block_refs = [
    'bo1', 'bo_left', 'bo_right', 'bc'
]

# Called when the node enters the scene tree for the first time.
func _ready():
    var blockgroup = get_node('../BlockGroup')
    for c in blockgroup.get_children():
        if c.get('block_id'):
            var bid = c.block_id
            if bid in block_refs:
                var ref = funcref(self, bid)
                c.set_inner(ref)
