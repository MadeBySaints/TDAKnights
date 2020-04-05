extends Resource

class_name StartingStats

export var job_name : String = "Class"

#player stats
export var strength : int
export var dexterity : int
export var intelligence : int
export var wisdom : int

#calculated stats
export var base_health : int
export var base_mana : int
export var base_xp_rate : float

export var base_attack : int
export var base_defense : int
export var base_speed : int
export var base_dodge : int
export var base_accuracy : float
export var base_crit_chance : float
export var base_health_regen_rate : float
export var base_mana_regen_rate : float
export var base_health_on_kill : int
export var base_mana_on_kill : int

#trackers
var total_hours
var items_sold : int
var pve_kills : int
var pvp_kills : int
var bestiary_score : int
var death_count : int
var quests_complete : int
var quests_failed : int
var quests_abandoned : int
var items_comsumed : int
var gold_spent : int
