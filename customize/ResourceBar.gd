tool
extends HBoxContainer

export var resourceName = "$$$ RESOURCE NEIME $$$" setget SetResourceName


onready var labelNode = find_node("Label")

func _ready():
	labelNode.text = resourceName

func SetResourceName(value):
	if labelNode:
		labelNode.text = value
	resourceName = value
	