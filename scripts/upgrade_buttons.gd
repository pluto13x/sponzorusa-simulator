extends VBoxContainer

signal to_sponzorusa(idx, idy)

#region load images
var lip_img = load("res://assets/upgrade icons/lipfiller.png")
var boob_img = load("res://assets/upgrade icons/boobJob.png")
var hair_img = load("res://assets/upgrade icons/hair.png")
var makeup_img = load("res://assets/upgrade icons/makeup.png")
#endregion

var upgrade_button = preload("res://scenes/upgrade_button.tscn")
var lip_filler = upgrade_button.instantiate()
var boob_job = upgrade_button.instantiate()
var hair = upgrade_button.instantiate()
var makeup = upgrade_button.instantiate()

func _ready() -> void:
	add_child(lip_filler)
	add_child(boob_job)
	add_child(hair)
	add_child(makeup)
	
	lip_filler.change_data(0, 0, "#LipFiller", "Get big, luscious lips 💋", "-$500", lip_img,  0, 500)
	boob_job.change_data(1, 0, "#BoobJob", "Upgrade your look... twice 👀", "-$1000", boob_img, 0, 1000)
	hair.change_data(2, 0, "#SilkyHair", "Get rid of the frizz 👱‍♀️", "-$100", hair_img, 0, 100)
	makeup.change_data(3, 0, "#MakeUp", "Buy some makeup and DIY 💄", "-$50", makeup_img, 0, 50)
	
	lip_filler.pressed_upgrade.connect(_on_upgrade_pressed)
	boob_job.pressed_upgrade.connect(_on_upgrade_pressed)
	hair.pressed_upgrade.connect(_on_upgrade_pressed)
	makeup.pressed_upgrade.connect(_on_upgrade_pressed)
	
func _on_upgrade_pressed(idx, idy) -> void:
	to_sponzorusa.emit(idx, idy)
	match idx:
		0: #lips
			print("Lip filler clicked")
		1: #boobs
			print("Boob job clicked")
		2: #hair
			print("Hair clicked")
		3: #makeup
			print("Makeup clicked")
