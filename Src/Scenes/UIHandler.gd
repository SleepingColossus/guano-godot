extends Node

@onready var score_label := $ScoreLabel
@onready var ammo_label := $AmmoLabel
@onready var streak_label := $StreakLabel
@onready var multiplier_label := $MultiplierLabel

func _ready():
    init_ui()

func _process(_delta):
    pass

func init_ui():
    score_label.text = "Score: 0"
    ammo_label.text = "Ammo: 8"
    streak_label.text = "Streak: 0"
    multiplier_label.text = "Multiplier: x1"

func _on_bird_rewards_collected(score, ammo, streak, multiplier):
    score_label.text = "Score: %d" % score
    ammo_label.text = "Ammo: %d" % ammo
    streak_label.text = "Streak: %d" % streak
    multiplier_label.text = "Multiplier: x%d" % multiplier

func _on_bird_shot_fired(ammo_remaining):
    ammo_label.text = "Ammo: %d" % ammo_remaining

func _on_bird_streak_broken(streak, multiplier):
    streak_label.text = "Streak: %d" % streak
    multiplier_label.text = "Multiplier: x%d" % multiplier
