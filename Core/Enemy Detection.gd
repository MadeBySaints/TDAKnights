extends Area2D
class_name Detection

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print(str('Player has entered')) #debug
