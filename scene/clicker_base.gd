extends Node

var click = 0
var clickPerSecond = 0
var costMejora1 = 15
var costMejora2 = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	$Cost.text = str(costMejora1)
	$Cost2.text = str(costMejora2)
	$"Mejora 1".visible = false
	$"Mejora 2".visible = false
	$Cost.visible = false
	$Cost2.visible = false

	$"Mejora 1".disabled = true
	$"Mejora 2".disabled = true
	
	


func _on_texture_button_pressed():
	click += 1
	click = int(click)
	$LabelClick.text = str(click)
	
	_MejoraVisility1()
	_MejoraVisibility2()

	_MejoraDisabled1()	
	_MejoraDisabled2()	
	



func _on_timer_timeout():
	click += clickPerSecond
	click = int(click)
	$LabelClick.text = str(click)
	# se añade a tiempo los disabled, esto es para que en simultaneo se vaya actualizando al valor del click
	_MejoraDisabled1() 
	_MejoraVisibility2()
	_MejoraDisabled2()

##-------- INICIO MEJORA 1 --------
func _MejoraVisility1():
	if click >= 10:
		$"Mejora 1".visible = true
		$Cost.visible = true
	
func _MejoraDisabled1():
	if click >= costMejora1:
		$"Mejora 1".disabled = false
	else:
		$"Mejora 1".disabled = true



func _on_mejora_1_pressed():
	clickPerSecond += 3
	click = click - costMejora1
	costMejora1 = costMejora1 * 1.6
	# esto es para volver el valor del costo en un numero entero
	costMejora1 = int(costMejora1) 
	#----------------------------------------------------------
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	$Cost.text = str(costMejora1)
	if click < costMejora1:
		$"Mejora 1".disabled = true
##-------- FIN MEJORA 1 --------


##------ INICIO MEJORA 2 ------
func _MejoraVisibility2():
	if click >= 20:
		$"Mejora 2".visible = true
		$Cost2.visible = true

func _MejoraDisabled2():
	if click >= costMejora2:
		$"Mejora 2".disabled = false
	else:
		$"Mejora 2".disabled = true
func _on_mejora_2_pressed():
	clickPerSecond += 5
	click = click - costMejora2
	costMejora2 = costMejora2 * 1.6
	# mismo funcionamiento que la mejora 1
	costMejora2 = int(costMejora2)
	#--------------------------------------------
	$Cost2.text = str(costMejora2)
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"

	if click < costMejora2:
		$"Mejora 2".disabled = true
##------ FIN MEJORA 2 --------


