tool
extends VBoxContainer

const resourceBarClass = preload("res://customize/ResourceBar.tscn")

export var resourceGroupName = "$$$ RISOURS $$$" setget setResourceGroupName
export var resources = PoolStringArray() setget setResources


onready var mainResource = find_node("MainResourceBar")
onready var resourceContainer = find_node("ResourceContainer")

func _ready():
	setResourceGroupName(resourceGroupName)

	

func setResourceGroupName(value):
	resourceGroupName = value
	if mainResource:
		mainResource.resourceName = value
	
	
func setResources(value):
	resources = value
	if resourceContainer:
		for c in resourceContainer.get_children():
			c.queue_free()
		for resource in value:
			var resourceBar = resourceBarClass.instance()
			resourceBar.resourceName = resource
			resourceContainer.add_child(resourceBar)
	