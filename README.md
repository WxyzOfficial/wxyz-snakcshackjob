	-- Add this to qb-core/shared/items.lua
        -- snack shack Drinks
        ["juice"]                      = {["name"] = "juice",                       ["label"] = "Strawberry Juice",                ["weight"] = 1,       ["type"] = "item",      ["image"] = "cocktail.png",              ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Strawberry Juice"},
    
        -- snack shack Food
        ["burger"]                       = {["name"] = "burger",                        ["label"] = "Cheese Burger",                    ["weight"] = 1,       ["type"] = "item",      ["image"] = "burger.png",               ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Yummy Chessy Burger"},
    
        -- snack shack Ingridients
        ["onion"]                    = {["name"] = "onion",                     ["label"] = "Onion",               ["weight"] = 1,       ["type"] = "item",      ["image"] = "onion.png",            ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "onion"},
        ["cheese"]                   = {["name"] = "cheese",                    ["label"] = "Cheese",              ["weight"] = 1,       ["type"] = "item",      ["image"] = "cheese.png",           ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "cheese"},
        ["cookingoil"]                    = {["name"] = "cookingoil",                     ["label"] = "Cooking Oil",               ["weight"] = 1,       ["type"] = "item",      ["image"] = "cookingoil.png",            ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "cookingoil"},
        ["bun"]                = {["name"] = "bun",                 ["label"] = "Bun",           ["weight"] = 1,       ["type"] = "item",      ["image"] = "bun.png",        ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Burger Bun"},
        ["patty"]                = {["name"] = "patty",                 ["label"] = "Patty",           ["weight"] = 1,       ["type"] = "item",      ["image"] = "patty.png",        ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "patty"},
        ["ketchup"]                = {["name"] = "ketchup",                 ["label"] = "Ketchup",           ["weight"] = 1,       ["type"] = "item",      ["image"] = "ketchup.png",        ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tomato ketchup"},        

	-- juice ingridient
    ["strawberry"]                = {["name"] = "strawberry",                 ["label"] = "Strawberry",           ["weight"] = 1,       ["type"] = "item",      ["image"] = "strawberry.png",        ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "strawberry"},

	-- add this to qb-smallresources/config.lua - consumables.
      -- Eat
	    ['burger'] = math.random(90, 95),
     -- Drink
      ['cocktail'] = math.random(90, 95),
    
