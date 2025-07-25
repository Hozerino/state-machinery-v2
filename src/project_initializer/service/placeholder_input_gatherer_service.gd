extends BaseInputGathererService

func gather_input() -> BaseInputData:
	return null


# Exemplo completao de implementação:
#func gather_input() -> BaseInputData:
#	var response = BaseInputData.new()
#
#	response.input_direction = Input.get_vector("left", "right", "forward", "backward")
#
#	if response.input_direction != Vector2.ZERO:
#		response.desired_states.append("WALK")
#		if Input.is_action_pressed("crouch"):
#			response.desired_states.append("CROUCH_WALK")
#		else:
#			if Input.is_action_pressed("sprint"):
#				response.desired_states.append("RUN")
#	if Input.is_action_just_pressed("jump"):
#		if(response.desired_states.has("RUN")):
#			response.desired_states.append("JUMP_RUN")
#		else:
#			response.desired_states.append("JUMP_WALK")
#
#	if response.desired_states.is_empty():
#		if Input.is_action_pressed("crouch"):
#			response.desired_states.append("CROUCH_IDLE")
#		response.desired_states.append("IDLE")
#
#	if Input.is_action_just_pressed("primary_attack"):
#		response.combat_actions.append("COMBAT_PRIMARY_ATTACK")
#
#	if Input.is_action_just_pressed("secondary_attack"):
#		response.combat_actions.append("COMBAT_SECONDARY_ATTACK")
#	return response
