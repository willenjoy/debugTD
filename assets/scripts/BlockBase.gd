class_name BlockBase
extends Node2D

export (String) var block_id

var data = []
var data_count = 0

# Called when the node enters the scene tree for the first time.
func level_controller():
    return get_node('../../LevelController')


func set_data(new_data):
    data = new_data
    data_count = len(data)
