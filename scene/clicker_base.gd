extends Node

var click = 0
var clickPerSecond = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	$"Mejora 1".visible = false
	$"Mejora 2".visible = false
	
	

func _on_texture_button_pressed():
	click += 1
	$LabelClick.text = str(click)
	_MejoraVisility1()
	_MejoraVisibility2()
	


func _on_timer_timeout():
	click += clickPerSecond
	$LabelClick.text = str(click)
	_MejoraVisibility2()


func _on_mejora_1_pressed():
	clickPerSecond += 3
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	


func _on_mejora_2_pressed():
	clickPerSecond += 5
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	
	
func _MejoraVisility1():
	if click >= 10:
		$"Mejora 1".visible = true
func _MejoraVisibility2():
	if click >= 20:
		$"Mejora 2".visible = true


