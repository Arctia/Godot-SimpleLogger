# SimpleLogger

Multi-level logging system for Godot with timestamps and file persistence.

## Features

- 5 log levels: TRACE, DEBUG, INFO, WARN, ERROR
- Full and abbreviated function names
- Optional timestamps
- File logging with auto-directory creation
- Configurable argument separator

## Properties

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `current_log_level` | LogLevel | DEBUG | Minimum log level to display |
| `enable_timestamp` | bool | true | Add timestamp to messages |
| `save_log` | bool | false | Save logs to file |
| `separator` | String | " " | Separator between arguments |
| `folder` | String | "" | Directory for log files |
| `log_filename` | String | "addons/Logs/data.log" | Log file path |

## Usage

```gdscript
# Full names
Log.trace("message", var1, var2)
Log.debug("message", data)
Log.info("message")
Log.warning("message")
Log.error("message", error_code)

# Abbreviated
Log.t("message", var1)
Log.d("message", data)
Log.i("message")
Log.w("message")
Log.e("message")

# Custom separator
Log.set_separator(", ")
Log.info("a", "b", "c")  # [INFO  ]: a, b, c

# One-time separator
Log.set_separator(" | ", true)
Log.info("x", "y")  # [INFO  ]: x | y
Log.info("a", "b")  # [INFO  ]: a b
```

## Output Format

```
[HH:MM:SS]|[LEVEL  ]: Message   # With timestamp
[LEVEL  ]: Message               # Without timestamp
```


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
