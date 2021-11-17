extends BlockBase


func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        print(body.index, ' ', body.value, ' ',
              data[body.index], ' ', 
              body.value == data[body.index])
        
        body.set_is_known(true)
        # body.is_bug = (body.value != output_data[body.index])

        body.queue_free_delayed(0.3)
