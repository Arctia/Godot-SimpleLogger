@tool
extends EditorPlugin


const AUTOLOAD_NAME = "Log"


func _enter_tree() -> void:
	# Add the autoload when the plugin is enabled
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/SimpleLogger/logger.gd")


func _exit_tree() -> void:
	# Remove the autoload when the plugin is disabled
	remove_autoload_singleton(AUTOLOAD_NAME)
