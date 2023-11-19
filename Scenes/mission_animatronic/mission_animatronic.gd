extends mission

func _ready():
	super._ready();
	var animatronics = get_tree().get_nodes_in_group("animatronics")
	for i in animatronics:
		if i is animatronic:
			i.on_completed_desafio = handle_on_complete_desafio;

func handle_on_complete_desafio():
	print("DESAFIO DFOI COMPLETADO")
	add_quantity();
