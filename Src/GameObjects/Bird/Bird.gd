class_name Bird

extends AnimatedSprite2D

signal shot_fired(ammo_remaining: int)
signal rewards_collected(score: int, ammo: int, streak: int, multiplier: int)
signal streak_broken(streak: int, multiplier: int)

@export var projectile : PackedScene
@export var ammo := 8

@onready var cooldown_timer := $Cooldown
var ready_to_fire := true

var score := 0
var score_multiplier := 1
var streak := 0

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

func _ready():
    # initialize UI
    # rewards_collected.emit(score, ammo, streak, score_multiplier)
    pass

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

func target_hit(target: Target):
    streak += 1
    score_multiplier = adjust_multiplier(streak)

    score += target.score_awarded * score_multiplier
    ammo += target.ammo_awarded

    rewards_collected.emit(score, ammo, streak, score_multiplier)

func target_missed():
    streak = 0
    score_multiplier = adjust_multiplier(streak)

    streak_broken.emit(streak, score_multiplier)

func adjust_multiplier(streak: int) -> int:
    var x = (streak / 10) + 1
    return max(x, 1)

func _on_cooldown_timeout():
    ready_to_fire = true
