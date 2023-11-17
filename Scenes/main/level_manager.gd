extends Node

@export var menu_scene: Resource = null;
@export var history_scene: Resource = null;
@export var world_scene: Resource = null;

var menu_instance: menu;
var history_instance: history;
var world_instance: world;

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_instance = load(menu_scene.resource_path).instantiate();
	add_child(menu_instance);
	menu_instance.on_click_play = start_history;

func start_history():
	menu_instance.queue_free();
	history_instance = load(history_scene.resource_path).instantiate();
	history_instance.on_finish_history = start_world;
	add_child(history_instance);

func start_world():
	history_instance.queue_free();
	world_instance = load(world_scene.resource_path).instantiate();
	add_child(world_instance);
