extends Node2D

@export var target : PackedScene

@onready var preview := $Preview
@onready var name_label := $NameLabel
@onready var desc_label := $DescriptionLabel
@onready var score_label := $ScoreLabel

# adjust score label
# says score if false
# says ammo if true
@export var awards_ammo := false

# Called when the node enters the scene tree for the first time.
func _ready():
    var t : Target = target.instantiate()
    t.position = preview.position
    add_child(t)

    # stop target from moving
    t.velocity = Vector2.ZERO

    name_label.text = t.target_name
    desc_label.text = t.description

    if awards_ammo:
        score_label.text = "Ammo: %d" % t.ammo_awarded
    else:
        score_label.text = "Score: %d" % t.score_awarded
