extends Area3D

@export var target: Node3D = null;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (body is player):
		body.global_position = target.global_position;
