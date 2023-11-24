extends Node3D

class_name world;

@export var _mission_manager: mission_manager;

var completed: Callable;
var failed: Callable;

# Called when the node enters the scene tree for the first time.
func _ready():
	_mission_manager.on_complete_all_missions = _completed
	_mission_manager.on_failed = _failed;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _completed():
	completed.bind().call();
	
func _failed():
	failed.bind().call()
