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
