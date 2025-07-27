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

