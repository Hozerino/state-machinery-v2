class_name BackendAnimationDatabase extends AnimationPlayer

# isso eh muito game-dependent, mas quando vc precisar, usa alguma implementacao disso...
# eu vou deixar a implementacao de BinaryBackendAnimationDatabase, q so tem true e false pra cada state
# mas vc pode fazer um com AnimationPlayer que use as flags (qm sabe um dia eu meto essa)

enum Flag {
	#IS_VULNERABLE
	# Coloca as vars aqui ^^
	# se n quiser fazer assim, cria um metodo pra cada flag aqui na "interface"
}
# e no get_property_value, usar o flag_key: Flag, pra poder chamar como Flag.IS_PIPIPI


func get_property_value(state_id: String, flag_key: Flag, current_progress: float, default_value: Variant) -> Variant:
	assert(false, "Oops, you tried to call get_property_value(...) on a so called interface")
	return default_value

# se facilicar sua vida vc pode criar as func aqui na interface tbm
#func is_vulnerable(state_id: String)
