extends BlockBase

export (PackedScene) var DataUnit

var spawn_count = 0
var max_spawn_count = 0
var speed = 0
onready var datagroup = get_node('../../DataGroup')


func _ready():
    var controller = level_controller()
    speed = controller.speed
    
    datagroup.position = position
    
    
func reset():
    spawn_count = 0
    
    
func _on_SpawnTimer_timeout():
    if spawn_count >= data_count:
        return
    
    var unit = DataUnit.instance()
    unit.add_to_group('dataunits')
    
    unit.position = Vector2(0, 0)
    unit.set_velocity(Vector2(0, speed))
    
    unit.set_index(spawn_count)
    unit.set_value(data[spawn_count])
    spawn_count += 1
    
    datagroup.add_child(unit)
