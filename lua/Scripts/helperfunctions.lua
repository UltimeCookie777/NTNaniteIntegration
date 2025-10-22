function NTNan.GetAfflictionResistances(afflictionName, tier)

    local affliction = NTNan.AfflictionsRes[afflictionName]

    if affliction == nil then return {} end

    local resistances = {}

    for key, i in ipairs(affliction.levels) do

        for _,value in pairs(i) do
            table.insert(resistances, value)
        end

        if key+1 == tier then return resistances end
    end
end

function NTNan.GetAllNanAfflictions(character)

    local l = {}

    for _,name in NTNan.Afflictions do
        if HF.HasAffliction(character, name) then table.insert(l, name) end
    end

    return l
end

