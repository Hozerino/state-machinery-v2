class_name State
extends Node

@export var id: String

#region Dependency Injection
var backend_animation_database: BackendAnimationDatabase
var model: Model
#endregion

func enter():
	pass

func exit():
	pass

func update(input_data: InputData, delta: float):
	pass
	#  TODO criar process_combos(input_data)

func should_transition_to(input_data: InputData) -> String:
	return self.id

### Execution time
var _state_enter_time: float = 0.0
func execution_time() -> float:
	return Time.get_unix_time_from_system() - _state_enter_time

func execution_already_passed(seconds: float) -> bool:
	return execution_time() >= seconds

func execution_still_before(seconds: float) -> bool:
	return execution_time() < seconds

func execution_is_between(start_time: float, end_time: float) -> bool:
	var t: float = execution_time()
	return t >= start_time and t <= end_time
