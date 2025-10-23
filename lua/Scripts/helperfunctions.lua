NTNan.Limbs = {LimbType.Head, LimbType.Torso, LimbType.LeftArm, LimbType.LeftLeg, LimbType.RightArm, LimbType.RightLeg}

function NTNan.GetAfflictionResistances(afflictionName, tier)

    local affliction = NTNan.AfflictionsRes[afflictionName]

    if affliction == nil then return {} end

    local resistances = {}


    for key, i in ipairs(affliction.levels) do

        if key >= tier then return resistances end

        for _,value in pairs(i) do
            table.insert(resistances, value)
        end

    end
end

function NTNan.GetAllNanAfflictions(character)

    local l = {}

    for _,name in NTNan.Afflictions do
        if HF.HasAffliction(character, name) then table.insert(l, name) end
    end

    return l
end

