class_name LevelController
extends Node


export (bool) var debug = true
export (int) var speed = 200


func bo1(value):
    return value
    
    
func bo_left(value):
    return value * 2
    

func bo_right(value):
    return value - 2 #1


func bc(value):
    return value % 2 == 0


var block_refs = [
    'bo1', 'bo_left', 'bo_right', 'bc'
]
var data = {
    'bs': [1, 2, 3, 4, 5],
    
    'bo1': [1, 2, 3, 4, 5],
    'bc': [false, true, false, true, false],
    'bo_left': [2, -1, 6, -1, 10],
    'bo_right': [-1, 1, -1, 3, -1],
    
    'be': [2, 1, 6, 3, 10]    
}

# Called when the node enters the scene tree for the first time.
func _ready():
    var blockgroup = get_node('../BlockGroup')
    for c in blockgroup.get_children():
        if c.get('block_id'):
            var bid = c.block_id
            if bid in block_refs:
                var ref = funcref(self, bid)
                c.set_inner(ref)
            if bid in data:
                c.set_data(data[bid])
                print(c, ' ', c.name, ' ', c.data)
