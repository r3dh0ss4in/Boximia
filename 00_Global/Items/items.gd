extends CanvasLayer

@onready var label: Label = $Control/Label

var items:int=0:
	set(value):
		items=value
		if label:
			label.text=str(items)

func _ready() -> void:
	label.text=str(items)
