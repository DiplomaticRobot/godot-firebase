#
# © 2026-present https://github.com/<<GitHubUsername>>
#

extends Node

@onready var godot_firebase_node: GodotFirebase = $GodotFirebase
@onready var get_godot_firebase_button: Button = $CanvasLayer/MainContainer/VBoxContainer/GetStateButton
@onready var _label: RichTextLabel = $CanvasLayer/MainContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _android_texture_rect: TextureRect = $CanvasLayer/MainContainer/VBoxContainer/TextureHBoxContainer/AndroidTextureRect as TextureRect
@onready var _ios_texture_rect: TextureRect = $CanvasLayer/MainContainer/VBoxContainer/TextureHBoxContainer/iOSTextureRect as TextureRect

var _active_texture_rect: TextureRect


func _ready() -> void:
	if OS.has_feature("ios"):
		_android_texture_rect.hide()
		_active_texture_rect = _ios_texture_rect
	else:
		_ios_texture_rect.hide()
		_active_texture_rect = _android_texture_rect

	godot_firebase_node.initialization_completed.connect(_on_initialization_completed)
	godot_firebase_node.initialization_error.connect(_on_initialization_error)

	_print_to_screen("Initializing Firebase...")
	godot_firebase_node.initialize()


func _on_initialization_completed() -> void:
	_print_to_screen("Firebase initialized successfully!")


func _on_initialization_error(a_error_message: String) -> void:
	_print_to_screen("Firebase initialization error: %s" % a_error_message, true)


func _on_get_button_pressed() -> void:
	_print_to_screen("Initialized: %s" % str(godot_firebase_node.is_initialized()))


func _print_to_screen(a_message: String, a_is_error: bool = false) -> void:
	if a_is_error:
		_label.push_color(Color.CRIMSON)

	_label.add_text("%s\n\n" % a_message)

	if a_is_error:
		_label.pop()
		printerr("Demo app:: " + a_message)
	else:
		print("Demo app:: " + a_message)

	_label.scroll_to_line(_label.get_line_count() - 1)
