extends Control

@export var data : NPC
@export var text : RichTextLabel
@export var name_container : RichTextLabel
@export var photo : TextureRect

var count = 0
var dialogue = []

# load text into array from txt file, and set up name and photo
func load_dialogue():
	name_container.text = data.name
	photo.texture = data.face
	if Constants.corrupt_state:
		name_container.push_bold()
		text.push_bold()
		text.text = "MMM, all the flavor..."
	# dialogue[0] = get_text_file_content(data.dialogue)

func get_text_file_content(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content
	
# look for player input to progress through text
func _process(_delta: float) -> void:
	if count < dialogue.size():
		if Input.is_action_just_pressed("Select"):
			text.text = dialogue[count + 1]
