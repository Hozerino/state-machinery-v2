class_name ModelStats extends Resource

func can_pay(state: State) -> bool:
	# aqui vc faz tipo:
	# return self.current_stamina >= state.stamina_cost
	return true

func pay(state: State) -> bool:
	if not can_pay(state):
		print("tentou dar pay() em algo q nao podia bro...")
		return false

	# faz o que tem que fazer aqui:
	#current_stamina -= state.stamina_cost
	return true

# regen de vida, stamina, whateva
func tick(delta: float):
	pass
