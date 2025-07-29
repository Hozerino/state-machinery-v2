class_name BinaryBackendAnimationDatabase extends BackendAnimationDatabase

var flag_table = {
	#"STATE_NAME": value
}

func get_property_value(state_id: String, flag_key: Flag, current_progress: float, default_value: Variant) -> Variant:
	# fuck current progress, this is a binary db
	if flag_table.get(state_id):
		return flag_table[state_id]
	return default_value
