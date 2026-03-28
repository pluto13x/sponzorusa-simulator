extends Node2D

@onready var upgrade_buttons: VBoxContainer = $"../../RightPanel/Panel/MarginContainer/ScrollContainer/UpgradeButtons"

func _ready():
	upgrade_buttons.to_sponzorusa.connect(_on_upgrade_pressed)
	
	
func _on_upgrade_pressed(idx, idy):
	print("received ", idx, idy)
