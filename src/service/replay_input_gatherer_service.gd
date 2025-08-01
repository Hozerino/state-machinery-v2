class_name ReplayInputGathererService extends InputGathererService

@export_file("*.demo") var replay_file: String = ""
var file = FileAccess.open(replay_file, FileAccess.READ)

func gather_input() -> InputData:
	var response = InputData.new()
	var line = file.get_line()
	if line:
		var json: Array = JSON.parse_string(line)
		if json.size() > 0:
			var obj = json[0]
			response.desired_states.append_array(obj['desired_states'])
			response.input_direction = _dict_to_vector2(obj['input_direction'])

	if (!response.desired_states.has("IDLE")):
		response.desired_states.append("IDLE")
	return response

func _ready() -> void:
	assert(!replay_file.is_empty(), "No replay file specified!")

	file = FileAccess.open(replay_file, FileAccess.READ)
	assert(file != null, "Failed to open replay file: %s" % replay_file)

func _dict_to_vector2(dict: Dictionary) -> Vector2:
	return Vector2(dict['x'], dict['y'])
