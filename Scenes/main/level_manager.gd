extends Node

@export var menu_scene: Resource = null;
@export var world_scene: Resource = null;

var menu_instance: menu;

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_instance = load(menu_scene.resource_path).instantiate();
	add_child(menu_instance);
	menu_instance.on_click_play = start_world;


func start_world():
	menu_instance.queue_free();
	var world_instance = load(world_scene.resource_path).instantiate();
	add_child(world_instance);
