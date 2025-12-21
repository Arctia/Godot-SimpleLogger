# LoggerAddon Documentation

A comprehensive logging system for Godot that provides multiple log levels, timestamps, and file persistence.

## Features

- Multiple log levels (TRACE, DEBUG, INFO, WARN, ERROR)
- Optional timestamps for each log message
- File logging with automatic directory creation
- Both full and abbreviated function names
- Configurable log filtering by level

## Configuration

### Inspector Properties

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `current_log_level` | LogLevel | DEBUG | Minimum log level to display |
| `enable_timestamp` | bool | true | Add timestamp to log messages |
| `save_log` | bool | false | Save logs to file |
| `folder` | String | "" | Directory for log files |
| `log_filename` | String | "addons/Logs/data.log" | Log file path |

## Log Levels

From lowest to highest priority:

- **TRACE**: Detailed debugging information
- **DEBUG**: General debugging information
- **INFO**: Informational messages
- **WARN**: Warning messages (displayed in yellow)
- **ERROR**: Error messages (displayed in red)

## Usage

### Full Function Names
```gdscript
Logger.trace("Detailed trace message", variable1, variable2)
Logger.debug("Debug information", value)
Logger.info("Application started")
Logger.warning("This is a warning")
Logger.error("An error occurred", error_code)
```

### Abbreviated Function Names
```gdscript
Logger.t("Trace", data)
Logger.d("Debug", data)
Logger.i("Info", data)
Logger.w("Warning", data)
Logger.e("Error", data)
```

## Log Output Format

**With timestamp:**
```
[HH:MM:SS]|[LEVEL  ]: Message content
```

**Without timestamp:**
```
[LEVEL  ]: Message content
```

## File Logging

When `save_log` is enabled:

1. Logs are saved to the specified file path
2. Directories are created automatically if they don't exist
3. Messages are appended to the file (not overwritten)
4. File operations are handled safely with error checking

### Example Configuration
```gdscript
Logger.current_log_level = LogLevel.DEBUG
Logger.enable_timestamp = true
Logger.save_log = true
Logger.folder = "user://logs/"
Logger.log_filename = "game.log"
```

## Tips

- Set `current_log_level` to `LogLevel.ERROR` in production to reduce console spam
- Use TRACE and DEBUG for development, remove them before shipping
- Combine multiple arguments in a single call for cleaner logs
- File logging automatically creates missing directories


## MIT License

Copyright (c) 2025 Vincenzo Gavioli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
