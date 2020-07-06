extends Node

var soundDC1 = load("res://Sounds/creaky_door_4.wav")
var soundDC2 = load("res://Sounds/door_creak_closing.wav")
var soundDC3 = load("res://Sounds/open_door_1.wav")
var soundclang = load("res://Sounds/jail_cell_door.wav")
var soundeerie = load("res://Sounds/eerie.ogg")

onready var playerD1 = $doorcreak1
onready var playerD2 = $doorcreak2
onready var playerD3 = $doorcreak3
onready var playerC1 = $clang
onready var playerE1 = $eerie

func playDoorOpen():
	playerD1.stream = soundDC1
	playerD1.play()
	
func playIndoorOpen():
	playerD3.stream = soundDC3
	playerD3.play()

func playDoorClose():
	playerD2.stream = soundDC2
	playerD2.play()

func playEnd():
	playerC1.stream = soundclang
	playerE1.stream = soundeerie
	playerC1.play()
	playerE1.play()

