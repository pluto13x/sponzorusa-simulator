extends Button

var upgrade_name = ""
var desc = ""
var price_text = ""
var follower_price = 0
var money_price = 0
var texture = "res://assets/upgrade icons/lipfiller.png"

func change_data(new_name, new_desc, new_price_text, new_texture, new_follower_price, new_money_price):
	follower_price = new_follower_price
	money_price = new_money_price

	$HBoxContainer/TextureRect.texture = new_texture
	$HBoxContainer/MarginContainer/VBoxContainer/Name.text = new_name
	$HBoxContainer/MarginContainer/VBoxContainer/Desc.text = new_desc
	$HBoxContainer/MarginContainer/VBoxContainer/Price.text = new_price_text
