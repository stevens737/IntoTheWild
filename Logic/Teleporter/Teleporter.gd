extends "res://Logic/PlayerDetector/PlayerDetector.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String) var area_name
export(String) var spawn_name

func _on_player_entered():
	Globals.area_system.call_deferred("transition_area", area_name, spawn_name);
