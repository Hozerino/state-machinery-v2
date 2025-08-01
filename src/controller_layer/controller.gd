# Provavelmente vc nao precisa mexer nesse script
# a nao ser na injecao de dependencias
extends CharacterBody3D
class_name Controller

# A magia acontece aqui, ce escolhe as implementacoes que quiser <3
# (mas se for mudar, muda o node no editor ne)
@onready var input_gatherer_service: InputGathererService = $InputGathererService
@onready var model: Model = $Model
@onready var view: View = $View

func _ready():
	view.model = model
	assert(model.current_state != null, "Please be sure to set an initial state for the model. If you already did that, sorry")

func _physics_process(delta: float) -> void:
	var input: InputData = input_gatherer_service.gather_input()
	model.tick(input, delta)
