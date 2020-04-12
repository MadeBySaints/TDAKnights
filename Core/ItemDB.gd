extends Node

class_name ItemDatabase

#The goal for this file is to store all base items in the game with any special
#data they might have. [e.g. sockets.]

#Number ranges determine where the item ID's should be added when a new item
#is introduced to the game.


#500-999 = Misc
var coin = [
	{id = 500, name = "Copper Coin", baseVal = 1, img = null},
	{id = 501, name = "Silver Coin", baseVal = 100, img = null},
	{id = 502, name = "Gold Coin", baseVal = 10000, img = null},
	{id = 503, name = "Crypt Coin", baseVal = 0, img = null},
	{id = 504, name = "Dragon Coin", baseVal = 0, img = null},
	{id = 505, name = "Shard", baseVal = 0, img = null}
]



#1000-1999 = Weapons
var weapon = [
	{id = 1000, name = "Recruit Sword", atk = 5, def = 1, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 1, weight = 1, delay = 1, baseVal = 5, img = "res://Sprites/Weapons/Recruit Sword.png"},
	{id = 1001, name = "Recruit Bow", atk = 5, def = 1, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 1, weight = 1, delay = 1, baseVal = 5, img = "res://Sprites/Weapons/Recruit Bow.png"},
	{id = 1002, name = "Recruit Mace", atk = 5, def = 1, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 1, weight = 1, delay = 1, baseVal = 5, img = "res://Sprites/Weapons/Recruit Mace.png"},
	{id = 1003, name = "Recruit Wand", atk = 5, def = 1, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 1, weight = 1, delay = 1, baseVal = 5, img = "res://Sprites/Weapons/Recruit Wand.png"}
]

#2000-2999 = Armors
var armor = [
	{id = 2000, name = "Leather Armor", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Armor.png"},
	{id = 2001, name = "Leather Belt", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Belt.png"},
	{id = 2002, name = "Leather Cape", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Cape.png"},
	{id = 2003, name = "Leather Gloves", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Gloves.png"},
	{id = 2004, name = "Leather Hood", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Hood.png"},
	{id = 2005, name = "Leather Pants", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Pants.png"},
	{id = 2006, name = "Leather Shoes", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Leather Shoes.png"},
	{id = 2007, name = "Plain Earring", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Plain Earring.png"},
	{id = 2008, name = "Reading Glasses", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Reading Glasses.png"},
	{id = 2009, name = "Silver Ring", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Silver Ring.png"},
	{id = 2010, name = "Black Bandana", atk = 0, def = 3, spd = 0, acc = 1, dod = 0, critMod = 1, expbonus = 0, hpOnHit = 0, mpOnHit = 0, hpRegen = 0, mpRegen = 0, charm = 0, weight = 1, baseVal = 5, img = "res://Sprites/Armors/Black Bandana.png"}
]

#3000-3999 = Consumables
var consumable = [
	{id = 3000, name = "Apple", hpOnUse = 10, mpOnUse = 0, weight = 1, timer = 0, baseVal = 20, img = "res://Sprites/Consumables/Apple.png"},
	{id = 3001, name = "Pear", hpOnUse = 0, mpOnUse = 10, weight = 1, timer = 0, baseVal = 20, img = "res://Sprites/Consumables/Pear.png"},
	{id = 3002, name = "HP Vial", hpOnUse = 25, mpOnUse = 0, weight = 1, timer = 0, baseVal = 50, img = "res://Sprites/Consumables/HP Vial.png"},
	{id = 3003, name = "MP Vial", hpOnUse = 0, mpOnUse = 25, weight = 1, timer = 0, baseVal = 50, img = "res://Sprites/Consumables/MP Vial.png"},
	{id = 3004, name = "HP Potion", hpOnUse = 50, mpOnUse = 0, weight = 1, timer = 0, baseVal = 100, img = "res://Sprites/Consumables/HP Potion.png"},
	{id = 3005, name = "MP Potion", hpOnUse = 0, mpOnUse = 50, weight = 1, timer = 0, baseVal = 100, img = "res://Sprites/Consumables/MP Potion.png"},
	{id = 3006, name = "HP Flask", hpOnUse = 100, mpOnUse = 0, weight = 1, timer = 0, baseVal = 200, img = "res://Sprites/Consumables/HP Flask.png"},
	{id = 3007, name = "MP Flask", hpOnUse = 0, mpOnUse = 100, weight = 1, timer = 0, baseVal = 200, img = "res://Sprites/Consumables/MP Flask.png"}
]

#4000-4999 = Components (for crafting with blueprints, made from refined mats and other items)
var component = [
	{id = 4000, name = "Bow String", baseVal= 6, craft = [
		{id = 6000, amt = 2}
	]},
	{id = 4001, name = "Wood Bow Frame", baseVal= 6, craft = [
		{id = 6015, amt = 3}
	]},
	{id = 4002, name = "Wood Arrow Shaft", baseVal= 6, craft = [
		{id = 6005, amt = 2}
	]},
	{id = 4003, name = "Stone Arrow Head", baseVal= 6, craft = [
		{id = 6001, amt = 2}
	]},
]

#5000-5999 = Raw Materials
var rawMat = [
	{id = 5000, name = "Stone", baseVal = 1, weight = 1, img = null},
	{id = 5001, name = "Plant Fiber", baseVal = 1, weight = 1, img = null},
	{id = 5002, name = "Iron Ore", baseVal = 1, weight = 1, img = null},
	{id = 5003, name = "Coal Ore", baseVal = 1, weight = 1, img = null},
	{id = 5004, name = "Sulfur Ore", baseVal = 1, weight = 1, img = null},
	{id = 5005, name = "Wood", baseVal = 1, weight = 1, img = null},
	{id = 5006, name = "Hide", baseVal = 1, weight = 1, img = null},
	{id = 5007, name = "Sand", baseVal = 1, weight = 1, img = null},
	{id = 5008, name = "Silver Ore", baseVal = 1, weight = 1, img = null},
	{id = 5009, name = "Gold Ore", baseVal = 1, weight = 1, img = null},
	{id = 5010, name = "Silicon Ore", baseVal = 1, weight = 1, img = null},
	{id = 5011, name = "Magnesium Ore", baseVal = 1, weight = 1, img = null},
	{id = 5012, name = "Raw Carbon", baseVal = 1, weight = 1, img = null},
	{id = 5013, name = "Bone", baseVal = 1, weight = 1, img = null},
	{id = 5014, name = "Copper Ore", baseVal = 1, weight = 1, img = null},
	{id = 5015, name = "Tin Ore", baseVal = 1, weight = 1, img = null},
	{id = 5016, name = "Platinum Ore", baseVal = 1, weight = 1, img = null},
	{id = 5017, name = "Cobalt Ore", baseVal = 1, weight = 1, img = null},
	{id = 5018, name = "Mithril Ore", baseVal = 1, weight = 1, img = null}
]

#6000-6999 = Refined Materials (crafted from raw mats)
var refinedMat = [
	{id = 6000, name = "Jute Twine", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5001, amt = 3}
	]},
	{id = 6001, name = "Iron Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5002, amt = 3}
	]},
	{id = 6002, name = "Copper Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5014, amt = 3}
	]},
	{id = 6003, name = "Tin Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5015, amt = 3}
	]},
	{id = 6004, name = "Bronze Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5014, amt = 3}, #copper ore
		{id = 5015, amt = 3} #tin ore
	]},
	{id = 6005, name = "Silver Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5008, amt = 3}
	]},
	{id = 6006, name = "Gold Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5009, amt = 3}
	]},
	{id = 6007, name = "Platinum Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5016, amt = 3}
	]},
	{id = 6008, name = "Silicon Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5010, amt = 3}
	]},
	{id = 6009, name = "Magnesium Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5011, amt = 3}
	]},
	{id = 6010, name = "Cobalt Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5017, amt = 3}
	]},
	{id = 6011, name = "Mithril Ingot", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5018, amt = 3}
	]},
	{id = 6012, name = "Bonemeal", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5013, amt = 3}
	]},
	{id = 6013, name = "Leather", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5006, amt = 3}
	]},
	{id = 6014, name = "Sulfur", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5004, amt = 3}
	]},
	{id = 6015, name = "Shaped Wood", baseVal = 3, weight = 1, img = null, craft = [
		{id = 5005, amt = 3}
	]}
]

#7000-7999 = Quest Items
var questItem = [
	{}
]

#8000-8999 = Key Items
var keyItem = [
	{}
]

#9000-9999 = Blueprints
var blueprint = [
	{}
]
