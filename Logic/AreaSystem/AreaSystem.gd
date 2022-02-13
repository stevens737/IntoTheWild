extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ScreenTransition = preload("res://Logic/ScreenTransition/ScreenTransition.tscn")

export(String) var initial_area
var current_area;

var areas = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.area_system = self
	
	for area in get_children():
		remove_child(area);
		areas[area.name] = area;
	
	current_area = areas[initial_area];
	add_child(current_area);
	
func transition_area(area_name, spawn_name):
	var transition: Node = ScreenTransition.instance();
	# Connect transition signals
	transition.connect("do_work", self, "transplant_player", [area_name, spawn_name]);
	add_child(transition);

func transplant_player(area_name, spawn_name):
	# Remove player from old area and insert them into new area
	var new_area: Node2D = areas[area_name]
	
	remove_child(current_area);
	add_child(new_area);
	
	current_area.remove_child(Globals.player);
	new_area.add_child(Globals.player);
	
	var spawn = new_area.get_node(spawn_name);
	Globals.player.global_position = spawn.global_position;
	
	current_area = new_area;
