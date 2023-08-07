extends Node2D

func _ready():
	pass

func set_player_turn_text_label():
	$turn_order.text = "Player's " + str(Variables.PlayerTurn) + " turn"

func win_check(): 
	var btnlist = Variables.button_list
	
	#row checks 
	if btnlist[0] != "" and btnlist[0] == btnlist[1] and btnlist[1] == btnlist[2]:
		return btnlist[0]
	elif btnlist[3] != "" and btnlist[3] == btnlist[4] and btnlist[4] == btnlist[5]:
		return btnlist[3]
	elif btnlist[6] != "" and btnlist[6] == btnlist[7] and btnlist[7] == btnlist[8]:
		return btnlist[6]
	# col checks 
	elif btnlist[0] != "" and btnlist[0] == btnlist[3] and btnlist[3] == btnlist[6]:
		return btnlist[0]
	elif btnlist[1] != "" and btnlist[1] == btnlist[4] and btnlist[4] == btnlist[7]:
		return btnlist[1]
	elif btnlist[2] != "" and btnlist[2] == btnlist[5] and btnlist[5] == btnlist[8]:
		return btnlist[2]
	# Diag checks 
	elif btnlist[0] != "" and btnlist[0] == btnlist[4] and btnlist[4] == btnlist[8]:
		return btnlist[0]
	elif btnlist[6] != "" and btnlist[6] == btnlist[4] and btnlist[4] == btnlist[2]:
		return btnlist[6]

func game_over(player):
	if player != null:
		$Board/Button1.disabled = true
		$Board/Button2.disabled = true
		$Board/Button3.disabled = true
		$Board/Button4.disabled = true
		$Board/Button5.disabled = true
		$Board/Button6.disabled = true
		$Board/Button7.disabled = true
		$Board/Button8.disabled = true
		$Board/Button9.disabled = true
		
		if player == "X":
			$turn_order.text = "Player 1 Wins!"
		else: 
			$turn_order.text = "Player 2 Wins!"


func _process(_delta):
	set_player_turn_text_label()
	game_over(win_check())
