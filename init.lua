-- mod-version:3
local core = require "core"
local common = require "core.common"
local command = require "core.command"
local config = require "core.config"

local previous_task = ""

local function try_run_task(task_name)
    local tasks = config.plugins.tasks 
    previous_task = task_name
    
    if tasks and tasks[task_name] then
        tasks[task_name]()
    else
        core.error('Unknown task "%s"', task_name) 
    end
end

command.add(nil, {
    ["task:run"] = function()
        core.command_view:enter("Run Task", {
            text=previous_task,
            submit=try_run_task,
            suggest=function(text)
                local names = {}
                for name, _ in pairs(config.plugins.tasks) do
                    table.insert(names, name)
                end
                return common.fuzzy_match(names, text)
            end
        })
    end,

    ["task:run-previous-task"] = function()
        if #previous_task > 0 then
            try_run_task(previous_task)
        else
            core.warn('No previous task')
        end
    end
})
