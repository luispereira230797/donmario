extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.enableCursor()
	$AnimationPlayer.play("Intro")
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		var gameOverMessage = load("res://Scenes/GameOverMessage.tscn")
		add_child(gameOverMessage.instance())
		$GameOverMessage.visible = true
