extends VBoxContainer

#load images
var lip_img = load("res://assets/upgrade icons/lipfiller.png")
var boob_img = load("res://assets/upgrade icons/boobJob.png")

var upgrade_button = preload("res://scenes/upgrade_button.tscn")
var lip_filler = upgrade_button.instantiate()
var boob_job = upgrade_button.instantiate()

func _ready() -> void:
	add_child(lip_filler)
	add_child(boob_job)
	lip_filler.change_data("a", "a", "a",lip_img,  0, 0)
	boob_job.change_data("astarst", "astar", "astarst",boob_img, 0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
