extends BaseState

# Pode criar coisas como:
# StateComAnimacao extends BaseState
# var animation_name: String

# Se o model tiver Skeleton/AnimationPlayer, dar model.animator.play(self.animation_name) aqui!
func _enter():
	pass

func _exit():
	pass

# Atualizacao em geral enquanto o player ta no estado
func _update(input_data: BaseInputData, delta: float):
	pass
