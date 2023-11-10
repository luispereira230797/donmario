extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.final()
	$LabelMessage.text = Global.gameOverMessage
	$LabelGameOver.text = Global.gameOverText
	$LabelFinalText.text = Global.gameOverFinalText
	$LabelGameOver.add_color_override("font_color", Global.gameOverFinalColor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BaseButton_pressed():
	Global.retry()
