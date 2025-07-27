extends Node3D
class_name Model

@onready var backend_animation_database: BackendAnimationDatabase = $BackendAnimationDatabase
@onready var controller = $".."
@export var stats: ModelStats

var states_table: Dictionary[String, State]

var states_priority_table: Dictionary[String, int] = {}
# create something like this example. the "stronger" the state is, the higher it goes
#    {
		#"IDLE": 0,
		#"WALK": 1,
		#"SPRINT": 2,
		#"MIDAIR": 20
	#}

var current_state: State

signal on_state_changed

func _ready() -> void:
	for node in _get_all_children($States):
		if(node is State):
			# validation
			if states_table.get(node.id):
				push_error("Oops, node with id=%s already registered." % [node.id])
			states_table[node.id] = node
	assert(states_table.size() > 0, "No states for the model " + str(get_path()))
	assert(states_priority_table.size() > 0, "Please create a priority table in " + str(get_path()))
	inject_dependencies()
	pass

func tick(input : InputData, delta : float):
	var next_state_id :String = current_state.should_transition_to(input)
	if next_state_id != "" and current_state.id != next_state_id:
		switch_to(next_state_id)
	current_state.update(input, delta)
	stats.tick(delta)

func switch_to(next_state_id : String):
	print("%s -> %s" % [current_state.id, next_state_id] )
	current_state.exit()
	current_state = states_table[next_state_id]
	current_state.enter()
	on_state_changed.emit()

func _get_all_children(node: Node) -> Array:
	var _nodes: Array = []
	for N in node.get_children():
		if N.get_child_count() > 0:
			_nodes.append(N)
			_nodes.append_array(_get_all_children(N))
		else:
			_nodes.append(N)
	return _nodes

func inject_dependencies():
	for state: State in states_table.values():
		state.backend_animation_database = backend_animation_database
		state.model = self
