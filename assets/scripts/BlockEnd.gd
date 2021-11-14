extends Node2D

var output_data = []

# Called when the node enters the scene tree for the first time.
func _ready():
    var controller = get_node('../LevelController')
    output_data = controller.output_data


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        print(body.index, ' ', body.value, ' ',
              output_data[body.index], ' ', 
              body.value == output_data[body.index])
        
        if body.value == output_data[body.index]:
            body.set_state(DataUnit.States.GOOD)
        else:
            body.set_state(DataUnit.States.BUG)
                
        body.queue_free_delayed(0.3)
