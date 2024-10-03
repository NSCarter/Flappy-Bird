extends RichTextLabel


func _ready():
	Stats.score_changed.connect(_on_score_changed)


func _on_score_changed(score):
	text = "[center]" + str(score) + "[/center]"
