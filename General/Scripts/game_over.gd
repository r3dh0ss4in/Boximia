extends CanvasLayer


func _ready() -> void:
	PlayerHealth.health=50
	PlayerHealth.max_health=50
	Power.amount=10
	Items.items=0


func _on_home_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")


func _on_retry_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Levels/00_Hason_Nogor/01.tscn")
