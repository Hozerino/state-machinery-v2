extends State

# @export var SPEED ou coisa assim

# os metodos enter() e exit() ja existem, se mexer neles vai ferrar a logica de get_progress
func _enter():
	pass

func _exit():
	pass

func update(input_data: InputData, delta: float):
	pass

func _state_transition_logic(input_data: InputData) -> String:
	return self.name
