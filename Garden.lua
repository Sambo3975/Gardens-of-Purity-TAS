-- GameData.speedrunProgress = GameData.speedrunProgress or 0
GameData.speedrunProgress = 0

local runs = {
	{ -- entrance -> Akropolis
		global = true,
		"rn",{"x",">=",-198816+16},
		"jrn",{12},
		"rn",{"tg"},
		"jrn",{12},
		"rn",{"tg"},
		"jrn",{16},
		"rn",{8},
		"ln",{"tg"},
		"jln",{"md"},
		"rn",{"tg"},
		"jrn",{"md"},
		"rn",{5},
		"ln",{"tg"},
		"jln",{"md"},
		"ln",{"tg"},
		"jln",{"md"},
		"ln",{"tg"},
		"jln",{"md"},
		"ln",{"x","<=",-199136},
		"jlun",{"md"},
	},
	{ -- Akropolis -> Asphodel
		global = true,
		"",{"nfs"},
		"ln",{{"ntg"},{"tg"}},
		"jlun",{math.huge},
	}
}

GameData.speedrunProgress = GameData.speedrunProgress + 1
return runs[GameData.speedrunProgress]