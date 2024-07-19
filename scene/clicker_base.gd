extends Node

var click = 0
var clickPerSecond = 0
var costMejora1 = 15
var costMejora2 = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
<<<<<<< Updated upstream
=======
	$"Mejora 1".visible = false
	$"Mejora 2".visible = false
	$"Mejora 1".disabled = true
	$"Mejora 2".disabled = true

>>>>>>> Stashed changes

func _on_texture_button_pressed():
	click += 1
	$LabelClick.text = str(click)
<<<<<<< Updated upstream
=======
	_MejoraVisility1()
	_MejoraVisibility2()
	_MejoraDisabled1()	
	_MejoraDisabled2()
>>>>>>> Stashed changes
	

func _on_timer_timeout():
	click += clickPerSecond
	$LabelClick.text = str(click)
<<<<<<< Updated upstream

=======
	
##-------- INICIO MEJORA 1 --------
func _MejoraVisility1():
	if click >= 10:
		$"Mejora 1".visible = true
	
func _MejoraDisabled1():
	if click >= costMejora1:
		$"Mejora 1".disabled = false
>>>>>>> Stashed changes

func _on_mejora_1_pressed():
	clickPerSecond += 3
	click = click - costMejora1
	costMejora1 = costMejora1 * 1.6
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	if click < costMejora1:
		$"Mejora 1".disabled = true
##-------- FIN MEJORA 1 --------


##------ INICIO MEJORA 2 ------
func _MejoraVisibility2():
	if click >= 20:
		$"Mejora 2".visible = true

func _MejoraDisabled2():
	if click >= costMejora2:
		$"Mejora 2".disabled = false
func _on_mejora_2_pressed():
	clickPerSecond += 5
	click = click - costMejora2
	costMejora2 = costMejora2 * 1.6
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
<<<<<<< Updated upstream
=======
	if click < costMejora2:
		$"Mejora 2".disabled = true
##------ FIN MEJORA 2 --------




>>>>>>> Stashed changes
