extends Node2D

@onready var upgrade_buttons: VBoxContainer = $"../../RightPanel/Panel/MarginContainer/ScrollContainer/UpgradeButtons"
const BODY_3 = preload("res://assets/sponzorusa/blonde hair asset.PNG")
const BODY_2 = preload("uid://dyqhavx68w2ql")
const BODY_1 = preload("uid://cljxc5aeb0qut")
const SISE_1 = preload("uid://d0duraq48p5d6")
const SISE_2 = preload("uid://blnr3d1hgyr40")
const SISE_3 = preload("uid://cl55p5v8hu5xb")
const SMINKA_1 = preload("uid://bm6n7qw7kr50y")
const SMINKA_2_BLONDE = preload("uid://7hshskrb4kog")
const SMINKA_2 = preload("uid://conki3mc4o8au")
const SMINKA_3_BLONDE = preload("uid://ddytxpy5ri633")
const SMINKA_3 = preload("uid://4lxg3wyii6j7")
const USNE_1 = preload("uid://doi8fx73245la")
const USNE_2 = preload("uid://c71epknrnvv6m")
const USNE_3 = preload("uid://dko6j2rxo60ea")




func _ready():
	upgrade_buttons.to_sponzorusa.connect(_on_upgrade_pressed)
	
func _on_upgrade_pressed(idx, idy):
	match idx:
		0: #lips
			match idy:
				0:
					$Body/Lips.texture = USNE_1
				1:
					$Body/Lips.texture = USNE_2
				2:
					$Body/Lips.texture = USNE_3
		1: #boobs
			match idy:
				0:
					$Body/Boobs.texture = SISE_1
				1:
					$Body/Boobs.texture = SISE_2
				2:
					$Body/Boobs.texture = SISE_3
		2: #hair
			match idy:
				0:
					$Body.texture = BODY_2
				1:
					$Body.texture = BODY_3
		3: #makeup
			match idy:
				0:
					$Body/Makeup.texture = SMINKA_1
				1:
					$Body/Makeup.texture = SMINKA_2
				2:
					$Body/Makeup.texture = SMINKA_3
