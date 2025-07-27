extends State

# @export var SPEED ou coisa assim

func enter():
	pass

func exit():
	pass

func update(input_data: InputData, delta: float):
	pass

func should_transition_to(input_data: InputData) -> String:
	return self.id

