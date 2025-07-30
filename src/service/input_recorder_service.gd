class_name InputRecorderService extends Node

@export var RECORD: bool = false
@export var RECORD_DURATION: float = 20.0
@export_dir var SAVE_TO_FOLDER: String
@export var MAX_BUFFER_SIZE: int = 15000

var frame_records: Array = []
var max_frame_count: int
var final_time = Time.get_unix_time_from_system() + RECORD_DURATION

@onready var _session_file_name = "%s/%s-%s.demo" % [SAVE_TO_FOLDER, get_parent().name, Time.get_unix_time_from_system()]
@onready var file = FileAccess.open(_session_file_name, FileAccess.WRITE_READ)

@export var watched_service: InputGathererService

func _exit_tree() -> void:
	_save_to_file()

func _ready() -> void:
	if !RECORD:
		set_physics_process(false)
		return

	max_frame_count = int(RECORD_DURATION * Engine.get_frames_per_second())

func _physics_process(delta: float) -> void:
	if Time.get_unix_time_from_system() >= final_time or !RECORD:
		print("cabou a gravasao")
		_save_to_file()
		set_physics_process(false)
		return

	var input_data = watched_service.gather_input()
	if input_data == null:
		return

	frame_records.append({
		"desired_states": input_data.desired_states,
		"input_direction": _vector2_to_dict(input_data.input_direction)
	})

	if(frame_records.size() >= MAX_BUFFER_SIZE):
		_save_to_file()
		frame_records.clear()


func _vector2_to_dict(v: Vector2) -> Dictionary:
	return {
		"x": v.x,
		"y": v.y
	}

func _save_to_file() -> void:
	var file = FileAccess.open(_session_file_name, FileAccess.READ_WRITE)
	if file:
		file.seek_end()
		var json_string = JSON.stringify(frame_records)
		file.store_line(json_string)
		file.close()
	else:
		print("Error saving game data: ", FileAccess.get_open_error())
