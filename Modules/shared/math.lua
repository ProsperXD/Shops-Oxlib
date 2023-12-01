if not lib then return end


local Modules = {}

function Modules.Format(number)
    number = number
    number = string.format("%d", number):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
    return number
end

function Modules.Multiply(amount,number)
        number = tonumber(number)
        number = number * tonumber(amount)
        number = math.floor(number)
        return number
end

return Modules