# Provavelmente vc nao precisa mexer nesse script
# a nao ser na injecao de dependencias
extends CharacterBody3D
class_name BaseController

# A magia acontece aqui, ce escolhe as implementacoes que quiser <3
# (mas se for mudar, muda o node no editor ne)
@onready var input_gatherer_service: BaseInputGathererService = $InputGathererService
@onready var model: BaseModel = $Model
@onready var view: BaseView = $View

func _ready():
	inject_dependencies()

func _physics_process(delta: float) -> void:
	var input = input_gatherer_service.gather_input()
	model.base_tick(input, delta)

func inject_dependencies():
	print("injetando model")
	view.model = model
