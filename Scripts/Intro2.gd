extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dialog = Global.intro2Dialog.duplicate()
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$DialogBox.playIntro()
	$AnimationPlayer.play("Intro")
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.seek(Global.introMusicTime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_expressions(pos):
	$ExpSee.visible = false
	$ExpSuspicious.visible = false
	var expressions = dialog[pos].character.split(",")
	for expresion in expressions:
		get_node(expresion).visible = true


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		pass
	elif anim_name == "End":
		get_tree().change_scene("res://Scenes/Level1.tscn")

func _on_DialogBox_next():
	if pos < dialog.size():
		$DialogBox.setTextAndIcon(dialog[pos].text, dialog[pos].talker)
		set_expressions(pos)
		pos+=1
	else:
		$DialogBox.hide()
		$AnimationPlayer.play("End")


func _on_DialogBox_finishIntro():
	_on_DialogBox_next()
