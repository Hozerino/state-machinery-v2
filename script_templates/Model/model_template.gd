extends Model
# se vc esta editando essa classe, reconsidere o q vc ta fazendo, a nao ser q so esteja adicionando alguma injecao de dependencia

# ela eh bem core e raramente deveria ser editada

func _ready() -> void:
	super._ready()

func _tick(input : InputData, delta : float):
	pass

func _on_switch(recently_switched_state: String):
	pass

func inject_dependencies():
	super.inject_dependencies()
