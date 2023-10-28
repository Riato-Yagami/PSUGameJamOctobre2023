extends Node

func sleep(s):
	await get_tree().create_timer(s).timeout
	return true

func sleep_beat(b = 1.0):
	await sleep(BeatManager.frequency*b)
	return true
