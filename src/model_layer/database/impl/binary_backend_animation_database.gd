class_name BinaryBackendAnimationDatabase extends BackendAnimationDatabase

var flag_table = {
	#"STATE_NAME": value
}

func get_property_value(state_name: String, flag_key: Flag, current_progress: float, default_value: Variant) -> Variant:
	# fuck current progress, this is a binary db
	if flag_table.get(state_name):
		return flag_table[state_name]
	return default_value
