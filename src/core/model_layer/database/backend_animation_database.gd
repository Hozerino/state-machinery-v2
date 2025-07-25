class_name BackendAnimationDatabase extends AnimationPlayer

# TODO implementar!
# tentar linkar state com animacao mas de um jeito pratico de editar e consultar, tipo:

### Durante a CRIAÇÃO: ###
# quero linkar State WALK -> Animation WALK_FLAG
# quero q seja facil de ver onde to botando as flags tlgd? ver a animacao tocando em uma janela e colcoar a flag em outra de um jeito facil
# tem q testar esse workflow

### pra buscar:
# db.get_flag_at(state_id, tempo: float)
# e se eu nao quiser bool? :( dps eu faco outros tipos, tipo o de Vector3D
func get_property_value(state_id: String, current_progress: float) -> bool:
	return false
