extends VBoxContainer

signal to_sponzorusa(idx, idy)
signal hired(perc)

#region load images
var lip_img = load("res://assets/upgrade icons/lipfiller.png")
var boob_img = load("res://assets/upgrade icons/boobJob.png")
var hair_img = load("res://assets/upgrade icons/hair.png")
var makeup_img = load("res://assets/upgrade icons/makeup.png")
var monetize_img = load("res://assets/upgrade icons/monetize.png")
var earbuds_img = load("res://assets/upgrade icons/earbuds.png")
var meal_img = load("res://assets/upgrade icons/meal.png")
var therapy_img = load("res://assets/upgrade icons/therapy.png")
var hire_img = load("res://assets/upgrade icons/hire.png")
#endregion

#region load sounds
@onready var pop: AudioStreamPlayer = $"../../../../../Pop"
@onready var boing: AudioStreamPlayer = $"../../../../../Boing"
@onready var dryer: AudioStreamPlayer = $"../../../../../Dryer"
@onready var shine: AudioStreamPlayer = $"../../../../../Shine"
#endregion

var upgrade_button = preload("res://scenes/upgrade_button.tscn")
var lip_filler = upgrade_button.instantiate()
var boob_job = upgrade_button.instantiate()
var hair = upgrade_button.instantiate()
var makeup = upgrade_button.instantiate()
var monetize = upgrade_button.instantiate()
var sponsor = upgrade_button.instantiate()
var hire = upgrade_button.instantiate()

func _ready() -> void:
	add_child(monetize)
	add_child(hair)
	add_child(makeup)
	add_child(sponsor)
	add_child(lip_filler)
	add_child(boob_job)
	add_child(hire)
	
	lip_filler.change_data(0, 0, "#LipFiller", "Get big, luscious lips 💋", "-$700", lip_img,  1.4, 700)
	boob_job.change_data(1, 0, "#BoobJob", "Upgrade your look... twice 👀", "-$6000", boob_img, 1.6, 6000)
	hair.change_data(2, 0, "#SilkyHair", "Get rid of the frizz 👱‍♀️", "-$20", hair_img, 1.1, 20)
	makeup.change_data(3, 0, "#LashExtensions", "Get voluminous lashes 👁️", "-$100", makeup_img, 1.2, 100)
	monetize.change_data(4, 0, "#Monetization", "Start making money💲", "👤100", monetize_img, 1, 0, 0, 100)
	sponsor.change_data(5, 0, "#RyuBuds #AD", "Your first sponsorship!💲", "👤1000 +$500 -👤3%", earbuds_img, 1, -500, 0.03, 1000)
	hire.change_data(6, 0, "#Automatization", "Hire posters 💻", "👤300 -$5% profits", hire_img, 1, 0, 0, 300)
	
	monetize.pressed_upgrade.connect(_on_upgrade_pressed)
	lip_filler.pressed_upgrade.connect(_on_upgrade_pressed)
	boob_job.pressed_upgrade.connect(_on_upgrade_pressed)
	hair.pressed_upgrade.connect(_on_upgrade_pressed)
	makeup.pressed_upgrade.connect(_on_upgrade_pressed)
	sponsor.pressed_upgrade.connect(_on_upgrade_pressed)
	hire.pressed_upgrade.connect(_on_upgrade_pressed)

func _process(_delta: float) -> void:
	for child in get_children():
		if child.follower_multiplier > 1 and child.money_price > $"../../../../..".money:
			child.disabled = true
		elif child.follower_multiplier == 1 and child.follower_price > $"../../../../..".followers:
			child.disabled = true
		else:
			child.disabled = false
		

func _on_upgrade_pressed(idx, idy, follower_multiplier, money_price, follower_loss) -> void:
	to_sponzorusa.emit(idx, idy)
	$"../../../../..".money -= money_price
	$"../../../../..".follower_multiplier *= follower_multiplier
	print($"../../../../..".followers)
	$"../../../../..".followers -= $"../../../../..".followers * follower_loss
	print($"../../../../..".followers)
	
	match idx: #update buttons to next upgrade
		0: #lips
			pop.play()
			match idy:
				0:
					lip_filler.change_data(0, 1, "#LipFiller", "Make em kissable 😘", "-$1400", lip_img,  1.5, 1400)
				1:
					lip_filler.change_data(0, 2, "#LipFiller", "Make em JUICY 💋", "-$2100", lip_img,  1.6, 2100)
				2:
					lip_filler.disabled_forever = true
		1: #boobs
			boing.play()
			match idy:
				0:
					boob_job.change_data(1, 1, "#BoobJob", "Get them melons 🍈", "-$12000", boob_img, 1.7, 12000)
				1:
					boob_job.change_data(1, 2, "#BoobJob", "Give em gravity 🌍", "-$18000", boob_img, 1.8, 18000)
				2:	
					boob_job.disabled_forever = true
		2: #hair
			dryer.play()
			match idy:
				0:
					hair.change_data(2, 1, "#BlondeHair", "Brighten up your look ☀️", "-$100", hair_img, 1.2, 100)
				1:
					hair.change_data(2, 2, "#Extensions", "Just like Rapunzel 👱‍♀️", "-$500", hair_img, 1.3, 500)
				2:	
					hair.disabled_forever = true
		3: #makeup
			shine.play()
			match idy:
				0:
					makeup.change_data(3, 1, "#JimmyMUA", "See a famous MUA", "-$500", makeup_img, 1.4, 500)
				1: 
					makeup.change_data(3, 2, "#TattooMakeup", "Be beautiful, always", "-$1000", makeup_img, 1.5, 1000)
				2:	
					makeup.disabled_forever = true
		4: #monetize
			$"../../../../..".monetized = 1
			monetize.disabled_forever = true
		5: #sponsors
			match idy:
				0:
					sponsor.change_data(5, 1, "#HelloHealth #AD", "Meal delivery service 🍖", "👤3000 +$1000 -👤6%", meal_img, 1, -1000, 0.06, 3000)
				1:
					sponsor.change_data(5, 2, "#GreatHelp #AD", "Mental health matters 😢", "👤6000 +$3000 -👤10%", therapy_img, 1, -3000, 0.06, 3000)
				2:
					sponsor.disabled_forever = true
		6: #hire
			match idy:
				0:
					$"../../../../..".autopost = true
					hired.emit(-0.05)
					hire.change_data(6, 1, "#ThankYouu", "Hire commenters 📱", "👤900 -$5% profits", hire_img, 1, 0, 0, 900)
				1: 
					hired.emit(-0.05)
					hire.change_data(6, 2, "#Chatters", "Hire chatters 💬", "👤2500 +$20% profits", hire_img, 1, 0, 0, 2500)
				2:
					hired.emit(0.2)
					hire.disabled_forever = true
