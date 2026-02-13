#
# © 2026-present https://github.com/<<GitHubUsername>>
#

@tool
@icon("icon.png")
class_name GodotFirebase extends Node

signal initialization_completed()
signal initialization_error(error_message: String)

const PLUGIN_SINGLETON_NAME: String = "@pluginName@"

var _plugin_singleton: Object


func _ready() -> void:
	_update_plugin()


func _notification(a_what: int) -> void:
	if a_what == NOTIFICATION_APPLICATION_RESUMED:
		_update_plugin()


func _update_plugin() -> void:
	if _plugin_singleton == null:
		if Engine.has_singleton(PLUGIN_SINGLETON_NAME):
			_plugin_singleton = Engine.get_singleton(PLUGIN_SINGLETON_NAME)
			_connect_signals()
		elif not Engine.is_editor_hint():
			GodotFirebase.log_error("%s singleton not found on this platform!" % PLUGIN_SINGLETON_NAME)


func _connect_signals() -> void:
	_plugin_singleton.connect("initialization_completed", _on_initialization_completed)
	_plugin_singleton.connect("initialization_error", _on_initialization_error)


func initialize() -> void:
	if _plugin_singleton:
		_plugin_singleton.initialize()
	else:
		GodotFirebase.log_error("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func is_initialized() -> bool:
	if _plugin_singleton:
		return _plugin_singleton.is_initialized()
	return false


func _on_initialization_completed() -> void:
	initialization_completed.emit()


func _on_initialization_error(a_error_message: String) -> void:
	initialization_error.emit(a_error_message)


static func log_error(a_description: String) -> void:
	push_error("%s: %s" % [PLUGIN_SINGLETON_NAME, a_description])


static func log_warn(a_description: String) -> void:
	push_warning("%s: %s" % [PLUGIN_SINGLETON_NAME, a_description])


static func log_info(a_description: String) -> void:
	print_rich("[color=lime]%s: INFO: %s[/color]" % [PLUGIN_SINGLETON_NAME, a_description])
