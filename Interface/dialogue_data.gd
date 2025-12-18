const DIALOGUES = {
	"player_death": [
		{
			"chance": 1,
			"script": [
				{"character": "Jailer Two", "text": "If only it were so easy."},
			]
		},
		{
			"chance": 1,
			"script": [
				{"character": "Jailer One", "text": "It can't die."},
				{"character": "Jailer Two", "text": "A shame."},
			]
		},
		# Empty script results in no dialogue - Use for if you don't want someone to always speak
		{
			"chance": 2,
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
				{"character": "Jailer One", "text": "It's afraid to go out and face it."},
			]
		},
	],
}
