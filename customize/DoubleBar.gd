tool
extends Control

export var minValue = 0 setget SetMinValue
export var maxValue = 100 setget SetMaxValue
export var value = 50 setget SetValue
export var delta = -20 setget SetDelta

func _ready():
	pass

func _draw():
	var originalRect = get_rect()
	originalRect.position = Vector2()
	var bulkRect = originalRect
	var deltaRect = originalRect
	bulkRect.size.x *= 1.0 * (value + delta) / (maxValue - minValue)
	deltaRect.position.x += bulkRect.size.x
	deltaRect.size.x *= -1.0 * delta / (maxValue - minValue)

	draw_rect(originalRect, Color(1.0, 1.0, 1.0), false)
	draw_rect(bulkRect.clip(originalRect), calcBulkColor())
	draw_rect(deltaRect.clip(originalRect), calcDeltaColor())


func calcPercent():
	return 1.0 * value / (maxValue - minValue)

func calcBulkColor():
	var p = clamp(calcPercent(), 0, 1)

	# if p > 0.5:
	return Color(1 - p, 0.8, max(0.3, p))
	# return Color(p, 1- p, 1 - p)


func calcDeltaColor():
	if delta > 0:
		return Color(1.0, 1.0, 1.0)
	return Color(0.8, 0.4, 0.4)

func SetMinValue(v):
	minValue = v
	update()

func SetMaxValue(v):
	maxValue = v
	update()

func SetValue(v):
	value = v
	update()

func SetDelta(v):
	delta = v
	update()
