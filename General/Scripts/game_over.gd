extends CanvasLayer


func _ready() -> void:
	PlayerHealth.health=50


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/00_Hason_Nogor/01.tscn")
