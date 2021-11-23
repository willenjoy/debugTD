class_name LevelController
extends Node


export (bool) var debug = true
export (int) var speed = 200
export (float) var restart_delay = 0.75
var paused = false
var current_test = 0

onready var blockgroup = get_node('../BlockGroup')
onready var spawn_timer = get_node('../BlockGroup/BlockStart/SpawnTimer')

func bo1(value):
    return value
    
    
func bo_left(value):
    return value * 2
    

func bo_right(value):
    return value - 2
    
    
func bo_right_fix(value):
    return value - 1


func bc(value):
    return value % 2 == 0


var block_refs = [
    'bo1', 'bo_left', 'bo_right', 'bc', 'bo_right_fix'
]
var tests = [
    {
        'bs': [1, 3, 5],
        
        'bo1': [1, 3, 5],
        'bc': [false, false, false],
        'bo_left': [2, 6, 10],
        'bo_right': [-1, -1, -1],
        
        'be': [2, 6, 10]
    },
    {
        'bs': [1, 2, 3, 4, 5],
        
        'bo1': [1, 2, 3, 4, 5],
        'bc': [false, true, false, true, false],
        'bo_left': [2, -1, 6, -1, 10],
        'bo_right': [-1, 1, -1, 3, -1],
        
        'be': [2, 1, 6, 3, 10]    
    }
]

# Called when the node enters the scene tree for the first time.
func _ready():
    update_PlayButton()
    update_test_label()
    $RunTimer.start(restart_delay)
    
    
func run_test():
    var data = tests[current_test]
    
    for c in blockgroup.get_children():
        c.reset()
        if c.get('block_id'):
            var bid = c.block_id
            if bid in block_refs:
                c.set_inner(get_funcref(bid))
            if bid in data:
                c.set_data(data[bid])
                print(c, ' ', c.name, ' ', c.data)


func update_PlayButton():
    if paused:
        $PlayButton.text = 'Play'
    else:
        $PlayButton.text = 'Pause'


func update_test_label():
    $TestLabel.text = 'Test #%d' % current_test


func get_funcref(bid):
    return funcref(self, bid)


func _on_PlayButton_pressed():
    paused = not paused
    spawn_timer.paused = paused
    update_PlayButton()
    var data_units = get_tree().get_nodes_in_group('dataunits')
    for unit in data_units:
        if paused:
            unit.pause()
        else:
            unit.resume()


func _on_RunTimer_timeout():
    run_test()


func _on_BlockEnd_done(succeeded):
    if succeeded:
        current_test += 1
        update_test_label()
    $RunTimer.start(restart_delay)
