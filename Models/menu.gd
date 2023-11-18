extends Control

class_name menu

var on_click_play: Callable;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Animacao.play("default");
	$AnimatedSprite2D2.play("default");

func _on_start_button_pressed():
	print("start game")
	if (on_click_play.is_valid()):
		on_click_play.call();


func _on_start_pressed():
	if (on_click_play.is_valid()):
		on_click_play.call();
