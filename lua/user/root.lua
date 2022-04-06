function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

-- https://stackoverflow.com/a/20460403
function findLast(haystack, needle)
    local i=haystack:match(".*"..needle.."()")
    if i==nil then return nil else return i-1 end
end

function parent_dir(dir)
    return dir:sub(1, findLast(dir, '/')-1)
end

term_pattern = parent_dir(os.getenv('HOME'))

local M = {}
function M.getroot(prefix, cwd, pattern)
    if not (prefix:find(term_pattern) == 1) then
        return cwd
    end
    possible_root_dir = prefix
    found = false
    while prefix ~= term_pattern do
        for _, dir in ipairs(pattern) do
            if file_exists(prefix .. '/' .. dir) then
                found = true
                possible_root_dir = prefix
                if not false then
                    return possible_root_dir
                end
                break
            end
        end
        prefix = parent_dir(prefix)
    end
    if found then
        return possible_root_dir
    else
        return cwd
    end
end
return M
