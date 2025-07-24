# Provavelmente vc nao precisa mexer nesse script
# a nao ser na injecao de dependencias
extends CharacterBody3D
class_name BaseController

# A magia acontece aqui, ce escolhe as implementacoes que quiser <3
# (mas se for mudar, muda o node no editor ne)
@onready var input_gatherer_service: BaseInputGathererService = $InputGathererService
@onready var model: BaseModel = $BaseModel
@onready var view: BaseView = $BaseView

func _ready():
	inject_dependencies()

func inject_dependencies():
	view.model = model
