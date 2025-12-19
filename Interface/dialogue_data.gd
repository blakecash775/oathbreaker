const DIALOGUES = {
	"player_death": [
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "If only it were so easy"},
			]
		},
		{
			"chance": 1,
			"script": [
				{"character": "Jailer Two", "text": "It can't die"},
				{"character": "Jailer One", "text": "A shame"},
			]
		},
		# Empty script results in no dialogue - Use for if you don't want someone to always speak
		{
			"chance": 10,
			"script": []
		},
	],
	"enemy_killed": [
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "Broken"},
				{"character": "Jailer Two", "text": "Like he is?"},
				{"character": "Jailer One", "text": "No, like it is"},
			]
		},
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "Stack the bodies higher"},
				{"character": "Jailer Two", "text": "Maybe you'll reach heaven"},
			]
		},
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "Disgusting thing"},
			]
		},
		{
			"chance": 50,
			"script": []
		},
	],
	# Passives
	"passive_prison": [
		{
			"chance": 1,
			"passive": true,
			"conditions": {"zone": "prison"},
			"script": [
				{"character": "Jailer One", "text": "It's afraid to go out and face it"},
			]
		},
	],
	"passive_generic": [
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Do you even remember your oaths?"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer One", "text": "Look at it, trying to put it all back together"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer One", "text": "The oathbreaker ruins everything he touches"},
				{"character": "Jailer Two", "text": "But it's all ruined already"},
				{"character": "Jailer One", "text": "She wasn't"},
				{"character": "Jailer Two", "text": "And he couldn't stand it"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "It's all about him now"},
				{"character": "Jailer One", "text": "Just like he wanted"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer One", "text": "He serves himself now"},
				{"character": "Jailer Two", "text": "He's better at it."},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Will we be bound to it forever?"},
				{"character": "Jailer One", "text": "If the world is just"},
				{"character": "Jailer Two", "text": "Do we deserve such a fate, sister?"},
				{"character": "Jailer One", "text": "..."},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Shattered glass"},
				{"character": "Jailer One", "text": "From different vases"},
				{"character": "Jailer Two", "text": "He thinks the pieces might still fit"},
			]
		},
	],
}
