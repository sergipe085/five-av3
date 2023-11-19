extends Line2D

class_name fio_conector

var fio_head: fio = null;
var fio_bottom: fio = null;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_all_connected()):
		points[1] = fio_head.get_fio_position();

func is_correct():
	return fio_head.cor == fio_bottom.cor;
	
func set_color(_c: Color):
	default_color = _c;
	
func is_all_connected() -> bool:
	return fio_bottom != null and fio_head != null;
	
func set_bottom(_f: fio):
	fio_bottom = _f;
	points[0] = fio_bottom.get_fio_position();
	set_color(fio_bottom.color)

func set_head(_f: fio):
	fio_head = _f;
	points[1] = fio_head.get_fio_position();
	
func connect_to_fio(_f: fio) -> bool:	
	_f.is_ocupado = true;
	if (!fio_bottom):
		set_bottom(_f);
		return false;
	else:
		set_head(_f);
		return true
	
