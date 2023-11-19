extends interactable

class_name animatronic
	
@export var _desafio: desafio;
var is_on = false;

var on_completed_desafio: Callable;

func interact(sender: player):
	if (is_on):
		return;
	_desafio.initialize(sender);
	_desafio.on_complete_desafio = on_complete_desafio;
	sender.desactivate_input();
	super.interact(sender);

func on_complete_desafio(d: desafio):
	is_on = true
	if (on_completed_desafio.is_valid()):
		on_completed_desafio.call();

	
