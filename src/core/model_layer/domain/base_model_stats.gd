class_name BaseModelStats extends Resource

# regen de vida, stamina, whateva
func tick(delta: float):
	_tick(delta)

### INTERFACE ###
func _tick(delta: float):
	pass
