extends Node2D


onready var block = get_node('..')
onready var level_controller = get_node('../../../LevelController')
var fix_function = '%s_fix'

# Called when the node enters the scene tree for the first time.
func _ready():
    var bid = block.block_id
    var fix_block = fix_function % bid
    if fix_block in level_controller.block_refs:
        print('Found fix for block %s: %s' % [bid, fix_block])
        block.set_inner(level_controller.get_funcref(fix_block))
