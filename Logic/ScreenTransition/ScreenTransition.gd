extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal do_work
signal finished

func do_work():
	emit_signal("do_work");
	
func _on_animation_finished(_anim_name):
	emit_signal("finished");
	remove_and_skip();
