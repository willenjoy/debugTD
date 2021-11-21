extends TextureButton

export (PackedScene) var tool_scene
onready var block = get_node('../../..')
onready var tool_group = get_node('..')
var was_added = false


func _on_ToolAddButton_pressed():
    if not was_added:
        var tool_instance = tool_scene.instance()
        block.add_child(tool_instance)
        was_added = true
        tool_group.visible = false
