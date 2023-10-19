@tool
extends Node3D

@export var body: Node3D
@export var target: Node3D
@export var forward_indicator: Node3D
@export var angle_indicator: Node3D
@export var label: Label3D

func _process(_delta):
	var text = ""
	var forward = -global_transform.basis.z

	text += "\nTARGET_POS_GLOBAL: %s" % target.global_position
	text += "\nGLOBAL_POS: %s" % global_position
	var target_pos = target.global_position - global_position

	text += "\nTARGET_POS: %s" % target_pos

	var angle_to = forward.signed_angle_to(target_pos, Vector3.UP)
	text += "\nANGLE_Y: %s" % angle_to

	forward_indicator.position = global_position + forward
	angle_indicator.position = global_position + forward.rotated(Vector3.UP, angle_to)
	label.text = text
