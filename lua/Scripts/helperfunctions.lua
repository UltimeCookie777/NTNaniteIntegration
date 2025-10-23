NTNan.Limbs = {LimbType.Head, LimbType.Torso, LimbType.LeftArm, LimbType.LeftLeg, LimbType.RightArm, LimbType.RightLeg}

function NTNan.GetAfflictionResistances(afflictionName, tier)

    local affliction = NTNan.AfflictionsRes[afflictionName]

    if affliction == nil then return {} end

    local resistances = {}

    for key, i in ipairs(affliction.levels) do

        for _,value in pairs(i) do
            table.insert(resistances, value)
        end

        if key == math.floor(tier) then return resistances end

    end
end

function NTNan.GetAllNanAfflictions(character)

    local l = {}

    for key,_ in NTNan.Afflictions do
        if HF.HasAffliction(character, key) then table.insert(l, key) end
    end

    return l
end

