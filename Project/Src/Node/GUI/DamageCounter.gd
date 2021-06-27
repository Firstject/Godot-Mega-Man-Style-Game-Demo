class_name DamageCounter extends Node2D


const LIMIT_TOP_OFFSET = 8


var GRAVITY = 450

var RANDOM_X_SWAY = 32

var RANDOM_Y_GEYSER_MIN = 150

var RANDOM_Y_GEYSER_MAX = 200

var stay_time = 0.8

var x_pos_sway = 0

var y_geyser = 0

var current_damage_value : float


onready var label = $Label

onready var delete_timer = $DeleteTimer

onready var level = $"/root/Level"


func _ready():
	delete_timer.connect('timeout', self, '_on_delete_timer_timeout')
	restart()


func _process(delta):
	global_position.x += x_pos_sway * delta
	global_position.y -= y_geyser * delta
	y_geyser -= GRAVITY * delta


func restart():
	start_delete_timer()
	x_pos_sway = rand_range(-RANDOM_X_SWAY, RANDOM_X_SWAY)
	y_geyser = rand_range(RANDOM_Y_GEYSER_MIN, RANDOM_Y_GEYSER_MAX)
	label.text = str(current_damage_value)


func start_delete_timer():
	delete_timer.start(stay_time)


func _on_delete_timer_timeout():
	queue_free()
