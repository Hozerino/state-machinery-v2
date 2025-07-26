class_name BaseState
extends Node

@export var id: String

signal on_enter
signal on_exit

#region Dependency Injection
var backend_animation_database: BackendAnimationDatabase
var model: BaseModel
#endregion

var _state_enter_time: float = 0.0

func enter():
	_state_enter_time = Time.get_unix_time_from_system()
	_enter()
	on_enter.emit()

func exit():
	_exit()
	on_exit.emit()

func update(input_data: BaseInputData, delta: float):
	_update(input_data, delta)
	#  TODO criar process_combos(input_data)

func should_transition_to(input_data: BaseInputData) -> String:
	var state_impl_response = self._transition_check(input_data)
	if state_impl_response:
		return state_impl_response

	return _transition_check(input_data)


### Execution time
func execution_time() -> float:
	return Time.get_unix_time_from_system() - _state_enter_time

func execution_already_passed(seconds: float) -> bool:
	return execution_time() >= seconds

func execution_still_before(seconds: float) -> bool:
	return execution_time() < seconds

func execution_is_between(start_time: float, end_time: float) -> bool:
	var t: float = execution_time()
	return t >= start_time and t <= end_time

#######################################
############## INTERFACE ##############
#######################################

func _enter():
	pass

func _exit():
	pass

func _update(input_data: BaseInputData, delta: float):
	pass

# retorna a melhor opcao segundo o input do player
# (como se o estado n tivesse importancia nesse quesito)
func _transition_check(input_data: BaseInputData) -> String:
	return input_data.desired_states[0]
