extends Node

var click = 0
var clickPerSecond = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"

func _on_texture_button_pressed():
	click += 1
	$LabelClick.text = str(click)
	


func _on_timer_timeout():
	click += clickPerSecond
	$LabelClick.text = str(click)


func _on_mejora_1_pressed():
	clickPerSecond += 3
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	


func _on_mejora_2_pressed():
	clickPerSecond += 5
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
