class_name BlockBase
extends Node2D

export (String) var block_id

# Called when the node enters the scene tree for the first time.
func level_controller():
    return get_node('../../LevelController')
