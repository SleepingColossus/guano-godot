class_name Bird

extends AnimatedSprite2D

signal shot_fired(ammo_remaining: int)
signal rewards_collected(score: int, ammo: int, streak: int, multiplier: int)
signal streak_broken(streak: int, multiplier: int)

@export var projectile : PackedScene
@export var ammo := 8

var ready_to_fire := true
@onready var cooldown_timer := $Cooldown
@onready var death_timer := $DeathTimer
var death_timer_duration : int

var score := 0
var score_multiplier := 1
var current_streak := 0

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

func _ready():
    # initialize UI
    # rewards_collected.emit(score, ammo, streak, score_multiplier)

    death_timer_duration = death_timer.wait_time

func _process(_delta):
    if Input.is_anything_pressed() && ready_to_fire && ammo > 0:
        ammo -= 1
        ready_to_fire = false

        var p = projectile.instantiate()
        p.global_position = global_position
        container.add_child(p)
        p.missed.connect(target_missed)

        cooldown_timer.start()
        shot_fired.emit(ammo)

        if ammo <= 0:
            death_timer.start()

func target_hit(target: Target):
    current_streak += 1
    score_multiplier = adjust_multiplier(current_streak)

    score += target.score_awarded * score_multiplier
    ammo += target.ammo_awarded

    rewards_collected.emit(score, ammo, current_streak, score_multiplier)

    if target.ammo_awarded > 0:
        # reset death timer
        death_timer.stop()
        death_timer.wait_time = death_timer_duration # not sure if necessary

func target_missed():
    current_streak = 0
    score_multiplier = adjust_multiplier(current_streak)

    streak_broken.emit(current_streak, score_multiplier)

func adjust_multiplier(streak: int) -> int:
    var x = (streak / 10) + 1
    return max(x, 1)

func _on_cooldown_timeout():
    ready_to_fire = true


func _on_death_timer_timeout():
    print_debug("game over")
