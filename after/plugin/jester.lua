function create_command(cmd, fn)
    vim.api.nvim_create_user_command(cmd, fn, {})
end

local jester = require('jester')

-- vim.api.nvim_create_user_command(
--     "JestFile",
--     function()
--         print("hi")
--         --[[ jester.run_file() ]]
--     end,
--     {}
-- )


create_command("JestFile", function()
    jester.run_file()
end)

create_command("JestLast", function()
    jester.run_last()
end)

create_command("JestNearest", function()
    jester.run()
end)

create_command("JestDebugFile", function()
    jester.debug_file()
end)

create_command("JestDebugLast", function()
    jester.debug_last()
end)

create_command("JestDebugNearest", function()
    jester.debug()
end)
