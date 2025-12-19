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
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "For a moment, a world without his cruelty"},
				{"character": "Jailer Two", "text": "But just a moment"},
			]
		},
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "You're alive. Fight."},
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
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "Felt good, didn't it?"},
			]
		},
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "Do you enjoy hurting other people?"},
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
				{"character": "Jailer One", "text": "It serves itself now"},
				{"character": "Jailer Two", "text": "It's better at it."},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Will we be bound to it forever?"},
				{"character": "Jailer One", "text": "If the world is just"},
				{"character": "Jailer Two", "text": "Do we deserve such a fate?"},
				{"character": "Jailer One", "text": "..."},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Shattered glass"},
				{"character": "Jailer One", "text": "From different vases"},
				{"character": "Jailer Two", "text": "It thinks the pieces might still fit"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Did he love her?"},
				{"character": "Jailer One", "text": "He thinks he did"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "It's eating him alive"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "Nothing is big"},
				{"character": "Jailer Two", "text": "Everything is very, very small"},
				{"character": "Jailer Two", "text": "There is almost nothing"},
			]
		},
		{
			"chance": 1,
			"passive": true,
			"script": [
				{"character": "Jailer Two", "text": "He's doing what he thinks is right."},
				{"character": "Jailer One", "text": "He has to be stopped."},
			]
		},
	],
}
