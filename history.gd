extends Control

class_name history

@export var textures: Array[TextureRect]

var timer = 0.0;
var timer_to_swich = 3.0;
var transitioning = false;
var current_texture = 0;
var target_texture = 0;

var on_finish_history: Callable;

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in textures:
		i.visible = false;
	textures[current_texture].visible = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta;
	if (timer >= timer_to_swich):
		transitioning = true;
	
	if (transitioning):
		$transition.color.a = lerp($transition.color.a, 1.0, 4 * delta);
		if ($transition.color.a >= 0.9):
			for i in textures:
				i.visible = false;
			current_texture+= 1;
			
			if (current_texture >= len(textures)):
				if on_finish_history.is_valid():
					on_finish_history.call();
				return;
			
			textures[current_texture].visible = true;
			timer = 0.0; 
			transitioning = false
	else:
		$transition.color.a = lerp($transition.color.a, 0.0, 4 * delta);
		
