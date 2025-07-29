class_name State
extends Node

@export var id: String
@export var DEFAULT_DURATION = -1

#region Dependency Injection
var backend_animation_database: BackendAnimationDatabase
var model: Model
#endregion

######## Core ########
func update(input_data: InputData, delta: float):
	pass

func default_transition_logic(input_data: InputData) -> String:
	if(self.DEFAULT_DURATION > 0 and self.execution_time() > DEFAULT_DURATION):
		print("total duration reached for state %s, changing" % self.name)
		return input_data.desired_states[0]

	check_combos(input_data)

	if has_forced_state:
		has_forced_state = false
		return forced_state

	return self._state_transition_logic(input_data)

func enter():
	_state_enter_time = Time.get_unix_time_from_system()
	self._enter()

func exit():
	self._exit()

######## Combos ########
var combos: Array[Combo] = []

func initialize_combos():
	for child in Utils.get_all_children(self):
		if child is Combo:
			print(self.name +  " -> Registering combo")
			combos.append(child)
			child.from_state = self

# TODO originalmente, isso aqui coloca na queue, mas como nao fiz nada de queue aqui, vou forcar o move
func check_combos(input: InputData) -> String:
	for combo: Combo in combos:
		if combo.meets_trigger_requirements(input):
			try_force_state(combo.to_state.name)
	return self.name

######## Forced state ########
var forced_state: String
var has_forced_state: bool
func try_force_state(new_forced_state: String):
	var new_priority = model.get_priority(new_forced_state)
	if not has_forced_state:
		has_forced_state = true
		forced_state = new_forced_state
	elif new_priority >= model.get_priority(forced_state):
		forced_state = new_forced_state
	else:
		print("didnt force, actual forced state too stronk")

######## Execution time ########
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


######## Interface ########
func _state_transition_logic(input_data: InputData) -> String:
	return self.name

func _enter():
	pass

func _exit():
	pass
