extends Node

@onready var score_label := $ScoreLabel
@onready var ammo_label := $AmmoLabel

func _ready():
    pass # Replace with function body.

func _process(_delta):
    pass

func _on_bird_rewards_collected(score, ammo):
    score_label.text = "Score: %d" % score
    ammo_label.text = "Ammo: %d" % ammo

func _on_bird_shot_fired(ammo_remaining):
    ammo_label.text = "Ammo: %d" % ammo_remaining
