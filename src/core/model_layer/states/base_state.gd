class_name BaseState
extends Node

@export var id: String

#region Dependency Injection
var backend_animation_database: BackendAnimationDatabase
var model: BaseModel
#endregion

# string vazia se quiser continuar no atual, senao passa o ID do proximo
func _transition_check(input_data: BaseInputData) -> String:
	return ""

func enter():
	_enter()

func exit():
	_exit()

func update(input_data: BaseInputData, delta: float):
	_update(input_data, delta)
	#  TODO criar process_combos(input_data)

func should_transition_to(input_data: BaseInputData) -> String:
	return _transition_check(input_data)


#######################################
############## INTERFACE ##############
#######################################

func _enter():
	pass

func _exit():
	pass

func _update(input_data: BaseInputData, delta: float):
	pass
