class_name SimpleLogger extends Node


enum LogLevel {
	TRACE,
	DEBUG,
	INFO,
	WARN,
	ERROR
}


@export var current_log_level:LogLevel = LogLevel.DEBUG
@export var enable_timestamp:bool = true
@export var save_log:bool = false
@export var separator:String = " "
@export var folder:String = ""
@export var log_filename:String = "addons/Logs/data.log"


const TIMESTAMP_FORMAT:String = "%H:%M:%S"
const LOG_FORMAT_TIMESTAMP:String = "[%s]|[%-6s]: %s"
const LOG_FORMAT:String = "[%-6s]: %s"


var log_file_path = folder + log_filename


var _tmp_separator:String = ""


#region Logger main stuff

## Set a separator, if once is set to true the separator it
## will be used only one time then going back to previous
func set_separator(sep: String, once:bool=false) -> void:
	if once: self._tmp_separator = self.separator
	self.separator = sep


func _print(level: LogLevel, ...args: Array) -> void:
	if level < current_log_level: return

	var level_str:String = LogLevel.keys()[level]
	var timestamp := Time.get_time_string_from_system()
	var text: String = ""
	for c:int in args.size():
		text += str(args[c])
		if c < args.size() - 1:
			text += self.separator

	var message:String = LOG_FORMAT_TIMESTAMP % [
		timestamp,
		level_str,
		text,
	] if self.enable_timestamp else LOG_FORMAT % [
		level_str,
		text,
	]

	match level:
		LogLevel.ERROR: push_error(message)
		LogLevel.WARN: push_warning(message)
		_: print(message)

	if self.save_log: self._save_logs_to_file(message)
	if self._tmp_separator != "":
		self.separator = self._tmp_separator
		self._tmp_separator = ""


func _save_logs_to_file(message: String) -> bool:
	var file := FileAccess.open(self.log_file_path, FileAccess.READ_WRITE)
	if file == null:
		DirAccess.make_dir_recursive_absolute(self.folder)
		var tmp_file = FileAccess.open(self.log_file_path, FileAccess.WRITE)
		if tmp_file == null:
			push_error("Failed to create file %s" % self.log_file_path)
			return false
		file = tmp_file
	file.seek_end()
	file.store_line(message)
	return true

#endregion


#region level functions

func trace(...args: Array) -> void:
	callv("_print", [LogLevel.TRACE] + args)

func debug(...args: Array) -> void:
	callv("_print", [LogLevel.DEBUG] + args)

func info(...args: Array) -> void:
	callv("_print", [LogLevel.INFO] + args)

func warning(...args: Array) -> void:
	callv("_print", [LogLevel.WARN] + args)

func error(...args: Array) -> void:
	callv("_print", [LogLevel.ERROR] + args)

#endregion


#region abbreviated functions

func t(...args: Array) -> void:
	callv("_print", [LogLevel.TRACE] + args)

func d(...args: Array) -> void:
	callv("_print", [LogLevel.DEBUG] + args)

func i(...args: Array) -> void:
	callv("_print", [LogLevel.INFO] + args)

func w(...args: Array) -> void:
	callv("_print", [LogLevel.WARN] + args)

func e(...args: Array) -> void:
	callv("_print", [LogLevel.ERROR] + args)

#endregion
