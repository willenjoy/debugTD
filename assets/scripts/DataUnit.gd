class_name DataUnit
extends RigidBody2D

enum States {UNKNOWN, GOOD, BUG}

var is_bug : bool = false
var is_known : bool = false

var unit_velocity = Vector2(0, 0)
var index = 0
var value = 0
var textures = [
    preload('res://assets/images/dataunit-base.png'),
    preload('res://assets/images/dataunit-good.png'),
    preload('res://assets/images/dataunit-bug.png')
] 

# Called when the node enters the scene tree for the first time.
func _ready():
    $Label.visible = get_node('../../LevelController').debug  
    set_texture()


func set_label():
    $Label.text = str(value)


func set_index(new_index):
    index = new_index


func set_value(new_value):
    value = new_value
    set_label()
    
    
func set_texture():
    # is_known  is_bug  state
    #        0       0      0
    #        0       1      0
    #        1       0      1
    #        1       1      2
    var state = int(is_known) + int(is_bug) * int(is_known)
    $Sprite.set_texture(textures[state])
    
    
func set_is_bug(is_bug_new):
    is_bug = is_bug_new
    set_texture()


func set_is_known(is_known_new):
    is_known = is_known_new
    set_texture()


func set_velocity(new_velocity):
    linear_velocity = new_velocity
    unit_velocity = new_velocity
    
    
func pause():
    linear_velocity = Vector2(0, 0)
    

func resume():
    linear_velocity = unit_velocity
    

func queue_free_delayed(delay):
    set_velocity(Vector2(0, 0))
    $Timer.start(delay)


func _on_Timer_timeout():
    queue_free()
