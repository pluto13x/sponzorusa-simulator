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
	
	lip_filler.change_data(0, 0, "#LipFiller", "Get big, luscious lips 💋", "-$700", lip_img,  1.4, 700)
	boob_job.change_data(1, 0, "#BoobJob", "Upgrade your look... twice 👀", "-$6000", boob_img, 1.6, 6000)
	hair.change_data(2, 0, "#SilkyHair", "Get rid of the frizz 👱‍♀️", "-$20", hair_img, 1.1, 20)
	makeup.change_data(3, 0, "#LashExtensions", "Get voluminous lashes 👁️", "-$100", makeup_img, 1.2, 100)
	
	lip_filler.pressed_upgrade.connect(_on_upgrade_pressed)
	boob_job.pressed_upgrade.connect(_on_upgrade_pressed)
	hair.pressed_upgrade.connect(_on_upgrade_pressed)
	makeup.pressed_upgrade.connect(_on_upgrade_pressed)

func _process(_delta: float) -> void:
	for child in get_children():
		if child.money_price > $"../../../../..".money:
			child.disabled = true
		else:
			child.disabled = false
		

func _on_upgrade_pressed(idx, idy, follower_multiplier, money_price) -> void:
	to_sponzorusa.emit(idx, idy)
	$"../../../../..".money -= money_price
	$"../../../../..".follower_multiplier *= follower_multiplier
	print($"../../../../..".follower_multiplier)
	
	match idx:
		0: #lips
			match idy:
				0:
					lip_filler.change_data(0, 1, "#LipFiller", "Make em kissable 😘", "-$1400", lip_img,  1.5, 1400)
				1:
					lip_filler.change_data(0, 2, "#LipFiller", "Make em JUICY 💋", "-$2100", lip_img,  1.6, 2100)
		1: #boobs
			match idy:
				0:
					boob_job.change_data(1, 1, "#BoobJob", "Get them melons 🍈", "-$12000", boob_img, 1.7, 12000)
				1:
					boob_job.change_data(1, 2, "#BoobJob", "Give em gravity 🌍", "-$18000", boob_img, 1.8, 18000)
		2: #hair
			match idy:
				0:
					hair.change_data(2, 1, "#BlondeHair", "Brighten up your look ☀️", "-$100", hair_img, 1.2, 100)
				1:
					hair.change_data(2, 2, "#Extensions", "Just like Rapunzel 👱‍♀️", "-$500", hair_img, 1.3, 500)
		3: #makeup
			match idy:
				0:
					makeup.change_data(3, 1, "#JimmyMUA", "See a famous MUA", "-$500", makeup_img, 1.4, 500)
				1: 
					makeup.change_data(3, 2, "#TattooMakeup", "Be beautiful, always", "-$1000", makeup_img, 1.5, 1000)
