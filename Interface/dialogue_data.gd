const DIALOGUES = {
	"player_death": [
		{
			"chance": 1,
			"script": [
				{"character": "Jailer Two", "text": "If only it were so easy."},
			]
		},
		# Empty script results in no dialogue - Use for if you don't want someone to always speak
		{
			"chance": 3,
			"script": []
		},
	],
	# Passives
	"passive_low_hp": [
		{
			"chance": 1,
			"passive": true,
			"conditions": {"zone": "prison"},
			"script": [
				{"character": "Jailer One", "text": "He's afraid to go out and face it."},
			]
		},
	],
}
