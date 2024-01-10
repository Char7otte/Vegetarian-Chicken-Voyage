extends Node

signal task_count_generated(task_count)

@export var task_day_multiplier = 2
@export var days_counter = 1

func _ready():
	calculate_daily_task_count()

func calculate_daily_task_count():
	var task_count = days_counter * task_day_multiplier
	call_deferred("emit_task_count_generated", task_count)

func emit_task_count_generated(task_count):
	task_count_generated.emit(task_count)
