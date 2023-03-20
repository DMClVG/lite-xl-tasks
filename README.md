# lite-xl-tasks
LiteXL plugin that allows the user to run custom tasks

# Usage

Install this plugin (https://github.com/lite-xl/lite-xl-plugins#how-to-install), then use config.plugins.tasks inside your user or project config file to setup your tasks like this:

```lua
local config = require "core.config"

config.plugins.tasks = {
  ["build"] = function()
    -- build task
  end,
  ["run"] = function()
    -- run task
  end,
-- ...
}
```

To run a task, use the task:run command.

