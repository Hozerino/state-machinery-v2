extends BaseState

# Pode criar coisas como:
# StateComAnimacao extends BaseState
# var animation_name: String

func id -> String:
	assert(false, "id not implemented for script " + str(get_path())) # gambi das boa so pra dar um erro
	return ""



# Se o model tiver Skeleton/AnimationPlayer, dar model.animator.play(self.animation_name) aqui!
func _enter():
	pass

func _exit():
	pass

# Atualizacao em geral enquanto o player ta no estado
func _update(input_data: BaseInputData, delta: float):
	pass

# retorna a melhor opcao segundo o input do player
# (como se o estado n tivesse importancia nesse quesito)
func _transition_check(input_data: BaseInputData) -> String:
	return input_data.desired_states[0]
