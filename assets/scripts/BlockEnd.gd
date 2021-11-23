extends BlockBase

signal done(succeeded)

var succeeded = true

func reset():
    succeeded = true

func _on_Area2D_body_entered(body):
    if body.is_in_group('dataunits'):
        print(body.index, ' ', body.value, ' ',
              data[body.index], ' ', 
              body.value == data[body.index])
        
        body.set_is_known(true)
        succeeded = succeeded and not body.is_bug
        
        body.queue_free_delayed(0.3)
        
        if body.index == len(data) - 1:
            print('Succeeded: ', succeeded)
            emit_signal("done", succeeded)
