extends Node3D
class_name BaseModel

@onready var backend_animation_database: BackendAnimationDatabase = $BackendAnimationDatabase
@export var stats: BaseModelStats = BaseModelStats.new()
# TODO melhorar tabela de prioridades ;-;

@onready var controller: BaseController = $".."

var states_table: Dictionary[String, BaseState]
var current_state: BaseState

func _ready() -> void:
	for node in _get_all_children($States):
		if(node is BaseState):
			print("Registering state=%s" % [node.id])
			# validation
			if states_table.get(node.id):
				push_error("Oops, node with id=%s already registered." % [node.id])
			states_table[node.id] = node
	inject_dependencies()
	self.current_state = states_table["IDLE"]

func base_tick(input : BaseInputData, delta : float):
	_sort_by_priority(input.desired_states)
	var next_state_id :String = current_state.should_transition_to(input)
	if next_state_id != "" and current_state.id != next_state_id:
		switch_to(next_state_id)
	current_state.update(input, delta)
	stats.tick(delta)
	self._tick(input, delta)

func switch_to(next_state_id : String):
	print(current_state.id + " -> " + next_state_id)
	current_state.exit()
	current_state = states_table[next_state_id]
	current_state.enter()

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
	for state: BaseState in states_table.values():
		state.backend_animation_database = backend_animation_database
		state.model = self

func _sort_by_priority(state_candidates: Array[String]):
	var sort_function = _custom_sort
	state_candidates.sort_custom(sort_function)

func _custom_sort(a: String, b: String):
	var states_priority_table = get_states_priority_table()
	if states_priority_table.get(a, 0) > states_priority_table.get(b, 0):
		return true
	else:
		return false


##### INTERFACE #####
func _tick(input : BaseInputData, delta : float):
	pass

func get_states_priority_table() -> Dictionary[String, int]:
	push_error("Please implement the function get_states_priority_table() in node " + str(get_path()))
	return {}
