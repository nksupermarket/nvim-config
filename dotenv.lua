-- dotenv.lua
local dotenv = {}

-- Function to read the .env file
local function readFile(filename)
	local file = io.open(filename, "r")
	if not file then
		return nil, "File not found: " .. filename
	end
	local content = file:read("*a")
	file:close()
	return content
end

-- Function to parse the .env content
local function parseEnv(content)
	local pairs = {}
	for line in content:gmatch("[^\r\n]+") do
		line = line:match("^%s*(.-)%s*$") -- Trim whitespace
		if line ~= "" and line:sub(1, 1) ~= "#" then -- Ignore comments and empty lines
			local key, value = line:match("([^=]+)=(.*)")
			if key and value then
				key = key:match("^%s*(.-)%s*$")
				value = value:match("^%s*(.-)%s*$")
				-- Remove quotes if present
				if value:sub(1, 1) == '"' and value:sub(-1, -1) == '"' then
					value = value:sub(2, -2):gsub('\\"', '"')
				elseif value:sub(1, 1) == "'" and value:sub(-1, -1) == "'" then
					value = value:sub(2, -2)
				end
				pairs[key] = value
			end
		end
	end
	return pairs
end

-- Load environment variables into _G table
function dotenv:load(filename)
	filename = filename or ".env"
	local content, err = readFile(filename)
	if not content then
		return nil, err
	end

	local envVars = parseEnv(content)

	return envVars
end

return dotenv
