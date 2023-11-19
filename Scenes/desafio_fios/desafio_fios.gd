extends desafio

class_name desafio_fios

var current_conector: fio_conector = null;
var conectores: Array[fio_conector] = []
var fios = []

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

		
func initialize(p: player):
	super.initialize(p);
	fios = get_tree().get_nodes_in_group("fios") as Array[fio]
	for f in fios:
		f.on_click = on_click_fio;

	
	
func reset():
	$Panel/Dica.text = "Ligue os fios na ordem correta"
	for i in conectores:
		i.queue_free()
	conectores.clear()
	correct_count = 0;
	
	for i in fios:
		i.is_ocupado = false
	status = "WAITING"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (current_conector and !current_conector.is_all_connected()):
		current_conector.points[1] = get_viewport().get_mouse_position();
	
func on_click_fio(_f: fio):
	if (_f.is_ocupado or is_failed()):
		return;
	
	if (!current_conector):
		current_conector = spawn_conector();

	var should_disconnect = current_conector.connect_to_fio(_f);
	if (should_disconnect):
		process_conection(current_conector)
		current_conector = null;
	

var correct_count = 0;
func process_conection(conector: fio_conector):
	if (conector.is_correct()):
		correct_count += 1;
		if (correct_count >= 4):
			on_complete();
	else:
		on_fail();
		

func spawn_conector() -> fio_conector:
	var instance = load("res://Scenes/desafio_fios/fio_conector.tscn").instantiate() as fio_conector;
	print(instance)
	add_child(instance)
	conectores.append(instance);
	return instance;
	
func on_fail():
	super.on_fail();
	$Panel/Dica.text = "Voce perdeu :("
	_player.active_input();
	reset()
	
func on_complete():
	super.on_complete();
	$Panel/Dica.text = "Voce ganhou :)"
	_player.active_input();
	reset();
