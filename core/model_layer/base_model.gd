extends Node3D
class_name BaseModel

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var skeleton: Skeleton3D = $AnimationPlayer
@onready var backend_animation_database: BackendAnimationDatabase = $BackendAnimationDatabase

@export var stats: BaseModelStats

var states_table: Dictionary[String, BaseState]
var current_state: BaseState

func _ready() -> void:
	for node in _get_all_children(self):
		if(node is BaseState):
			# validation
			if states_table.get(node.id):
				push_error("Oops, node with id=%s already registered." % [node.id])
			states_table[node.id] = node
	pass

func base_tick(input : BaseInputData, delta : float):
	var next_state_id :String = current_state.should_transition_to(input)
	if next_state_id != "" and current_state.identifier != next_state_id:
		switch_to(next_state_id)
	current_state.update(input, delta)
	stats.tick(delta)

func switch_to(next_state_id : String):
	print("%s -> %s" % [current_state.id % next_state_id] )
	current_state.exit()
	current_state = states_table[next_state_id]
	current_state.enter()
	animator.play(current_state.animation_name)

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

##### INTERFACE #####
func _tick(input : BaseInputData, delta : float):
	pass
