// Electric spiders fire taser-like beams at their enemies.
// TODO: AI

/mob/living/simple_mob/animal/giant_spider/electric
	desc = "Spined and yellow, it makes you shudder to look at it. This one has flickering gold eyes."
	icon_state = "spark"
	icon_living = "spark"
	icon_dead = "spark_dead"

	maxHealth = 210
	health = 210

	taser_kill = 0 //It -is- the taser.

	base_attack_cooldown = 10
	projectilesound = 'sound/weapons/taser2.ogg'
	projectiletype = /obj/item/projectile/beam/stun/electric_spider

	melee_damage_lower = 10
	melee_damage_upper = 25

	poison_chance = 15
	poison_per_bite = 3
	poison_type = "stimm"

	shock_resist = 0.75

	player_msg = "You can fire a taser-like ranged attack by clicking on an enemy or tile at a distance."

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/electric_spider


/obj/item/projectile/beam/stun/electric_spider
	name = "stun beam"
	agony = 20

// The electric spider's AI.
/datum/ai_holder/simple_mob/ranged/electric_spider

/datum/ai_holder/simple_mob/ranged/electric_spider/max_range(atom/movable/AM)
	if(isliving(AM))
		var/mob/living/L = AM
		if(L.incapacitated(INCAPACITATION_DISABLED) || L.stat == UNCONSCIOUS) // If our target is stunned, go in for the kill.
			return 1
	return ..() // Do ranged if possible otherwise.