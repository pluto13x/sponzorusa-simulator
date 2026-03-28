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
	makeup.change_data(3, 0, "#LashExtensions", "Get voluminous lashes 👁️", "-$50", makeup_img, 0, 50)
	
	lip_filler.pressed_upgrade.connect(_on_upgrade_pressed)
	boob_job.pressed_upgrade.connect(_on_upgrade_pressed)
	hair.pressed_upgrade.connect(_on_upgrade_pressed)
	makeup.pressed_upgrade.connect(_on_upgrade_pressed)
	
func _on_upgrade_pressed(idx, idy) -> void:
	to_sponzorusa.emit(idx, idy)
	match idx:
		0: #lips
			match idy:
				0:
					lip_filler.change_data(0, 1, "#LipFiller", "Make em kissable 😘", "-$500", lip_img,  0, 500)
				1:
					lip_filler.change_data(0, 2, "#LipFiller", "Big, JUICY lips 💋", "-$500", lip_img,  0, 500)
		1: #boobs
			match idy:
				0:
					boob_job.change_data(1, 1, "#BoobJob", "Get them melons 🍈", "-$1000", boob_img, 0, 1000)
				1:
					boob_job.change_data(1, 2, "#BoobJob", "Give em gravity 🌍", "-$1000", boob_img, 0, 1000)
		2: #hair
			match idy:
				0:
					hair.change_data(2, 1, "#BlondeHair", "Just like Rapunzel 👱‍♀️", "-$100", hair_img, 0, 100)
		3: #makeup
			match idy:
				0:
					makeup.change_data(3, 1, "#JimmyMUA", "See a famous MUA", "-$500", makeup_img, 0, 500)
				1: 
					makeup.change_data(3, 2, "#TattooMakeup", "Be beautiful, always", "-$50", makeup_img, 0, 50)
