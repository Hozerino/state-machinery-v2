extends Node3D
class_name View

##### INJECTION! #####
@export var model: Model

# se vc quiser fazer a animacao aqui, é só fazer algo assim na _ready:
# model.on_state_changed.connect(on_model_state_change)
# e la na on_model_state_change vc da um animation.play(animacao do estado)
# vc pode colocar o animation_name dentro do state, mas se quiser desacoplar 100%
# eh melhor fazer um de->para de State->Animacao na camada de apresentacao (aqui)

# pega as info do model (skeleton, resources, whatever) e apresenta
# seja na skin do boneco ou no HUD
func _process(_delta):
	pass
