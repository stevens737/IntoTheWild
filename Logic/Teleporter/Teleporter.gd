extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String) var area_name
export(String) var spawn_name

func _on_body_entered(body):
	if (body == Globals.player):
		Globals.area_system.call_deferred("transition_area", area_name, spawn_name);
