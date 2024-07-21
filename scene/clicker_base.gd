extends Node

#este metodo de señal (use chatgpt) actualiza al momento en que se ejecuta cada señal
signal click_updated

var click = 0
var clickPerSecond: float = 0
var costMejora1 = 15
var costMejora2 = 30
var costClickMejora = 50
var clickMejorado = 1
var lvlMejora1 = 1
var LvlMejora2 = 1

func _ready():
# Called when the node enters the scene tree for the first time.
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	$Cost.text = str(costMejora1)
	$Cost2.text = str(costMejora2)
	$CostXclick.text = "Costo de Mejora: " + str(costClickMejora)
	$"Mejora 1".visible = false
	$"Mejora 2".visible = false
	$Lvl_Cost_Mejora.visible = false
	$Lvl_Cost_Mejora2.visible = false
	
	$Cost.visible = false
	$Cost2.visible = false
	$"Mejora 1".disabled = true
	$"Mejora 2".disabled = true
	$Mejora_X_Click.disabled = true
	$Lvl_Cost_Mejora.text = "Lvl: " + str(lvlMejora1)
	$Lvl_Cost_Mejora2.text= "Lvl: " + str(LvlMejora2)
	#aqui se realiza la coneccion con la señal, mediante el "callable" o llamado al metodo y update_mejora_buttons
	# es la func llamada
	connect("click_updated",Callable(self, "_update_mejora_buttons"))
	

func _on_texture_button_pressed():
	if clickMejorado <= 0:
		click += 1
	else:
		click = click + clickMejorado
	click = int(click)
	$LabelClick.text = str(click)
	emit_signal("click_updated")
	
func _on_timer_timeout():
	
	click += clickPerSecond
	click = int(click)
	$LabelClick.text = str(click)
	emit_signal("click_updated")
	
	#funcion utilizada para la emicion de señal 
	#aqui se ejecutaran todos los metodos que necesiten una actualizacion inmediata al hacer click en su 
	#respectivo boton
func _update_mejora_buttons():
	_MejoraVisility1()
	_MejoraVisibility2()
	_MejoraDisabled1()
	_MejoraDisabled2()
	_MejoraxClickDisabled()

##-------- INICIO MEJORA 1 --------
func _MejoraVisility1():
	if click >= 10:
		$"Mejora 1".visible = true
		$Cost.visible = true
		$Lvl_Cost_Mejora.visible = true
	
func _MejoraDisabled1():
	if click >= costMejora1:
		$"Mejora 1".disabled = false
	else:
		$"Mejora 1".disabled = true

func _on_mejora_1_pressed():
	clickPerSecond += 3
	click = click - costMejora1
	costMejora1 = int(costMejora1 * 1.6)
	lvlMejora1 += 1
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
	$Cost.text = str(costMejora1)
	$Lvl_Cost_Mejora.text = "Lvl: " + str(lvlMejora1)
	#aqui se decide usar la señal "click update" mencionada en el principio del codigo
	emit_signal("click_updated")
##-------- FIN MEJORA 1 --------


##------ INICIO MEJORA 2 ------
func _MejoraVisibility2():
	if click >= 20:
		$"Mejora 2".visible = true
		$Cost2.visible = true
		$Lvl_Cost_Mejora2.visible = true

func _MejoraDisabled2():
	if click >= costMejora2:
		$"Mejora 2".disabled = false
	else:
		$"Mejora 2".disabled = true
func _on_mejora_2_pressed():
	clickPerSecond += 5
	click = click - costMejora2
	costMejora2 = int(costMejora2 * 1.6)
	LvlMejora2 += 1
	
	$Lvl_Cost_Mejora2.text = "Lvl: " + str(LvlMejora2)
	$Cost2.text = str(costMejora2)
	$LabelClick.text = str(click)
	$LabelClickPerSecon.text = str(clickPerSecond) + " /s"
#aqui se decide usar la señal "click update" mencionada en el principio del codigo
	emit_signal("click_updated")
##------ FIN MEJORA 2 --------

#----------Mejora x Click ------------
func _MejoraxClickDisabled():
	if click >= costClickMejora:
		$Mejora_X_Click.disabled = false
	else:
		$Mejora_X_Click.disabled = true

func _on_mejora_x_click_pressed():
	if click >= costClickMejora:
		clickMejorado += 1
		click = click - costClickMejora
		costClickMejora = int(costClickMejora * 1.8)
		$LabelClick.text = str(click)
		$CostXclick.text = "Costo de Mejora: " + str(costClickMejora)
		emit_signal("click_updated")

