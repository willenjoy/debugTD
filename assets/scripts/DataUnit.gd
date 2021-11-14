class_name DataUnit
extends RigidBody2D

enum States {UNKNOWN, GOOD, BUG}

var state : int = States.UNKNOWN
var index = 0
var value = 0
var textures = [
    preload('res://assets/images/dataunit-base.png'),
    preload('res://assets/images/dataunit-good.png'),
    preload('res://assets/images/dataunit-bug.png')
] 

# Called when the node enters the scene tree for the first time.
func _ready():    
    pass # Replace with function body.


func set_label():
    $Label.text = str(value)


func set_index(new_index):
    index = new_index


func set_value(new_value):
    value = new_value
    set_label()
    
    
func set_state(new_state):
    state = new_state
    $Sprite.set_texture(textures[state])


func queue_free_delayed(delay):
    linear_velocity = Vector2(0, 0)
    $Timer.start(delay)

func _on_Timer_timeout():
    queue_free()
