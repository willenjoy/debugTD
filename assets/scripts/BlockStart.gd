extends Node2D

export (PackedScene) var DataUnit

var spawn_count = 0
var input_data = []
var max_spawn_count = 0

func _ready():
    var controller = get_node('../LevelController')
    input_data = controller.input_data
    max_spawn_count = len(input_data)
    
    
func _on_SpawnTimer_timeout():
    if spawn_count >= max_spawn_count:
        return
    
    var unit = DataUnit.instance()
    unit.add_to_group('dataunits')
    
    unit.position = Vector2(0, 0)
    unit.linear_velocity = Vector2(0, 200)
    
    unit.set_index(spawn_count)
    unit.set_value(input_data[spawn_count])
    spawn_count += 1
    
    add_child(unit)
