extends ColorRect

class_name fio;

@export var fio_pos: Node2D;

enum FIO_COR {
	AZUL,
	VERDE,
	VERMELHO,
	AMARELO
}

@export var cor: FIO_COR = 0

var on_click: Callable;
var is_ocupado = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if (on_click.is_valid()):
		on_click.bind(self).call()
		
func get_fio_position() -> Vector2:
	return fio_pos.global_position;
