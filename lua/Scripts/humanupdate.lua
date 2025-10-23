function NTNan.UpdateHuman(character)
        
    --local aff = NTNan.GetAllNanAfflictions(character)

    local function applyHeals(character, healStats)

        for _,hl in pairs(healStats)do
            
            local affName = hl[1]
            local str = hl[2]

            for _,limb in pairs(NTNan.Limbs) do
                HF.AddAfflictionLimb(character, affName, limb, -1*str*NT.Deltatime)
            end
        end

    end


    --Reconstructor
    if HF.HasAffliction(character, NTNan.Afflictions.Reconstructor) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.Reconstructor, HF.GetAfflictionStrength(character, NTNan.Afflictions.Reconstructor)))
    end

    --BoneFix
    if HF.HasAffliction(character, NTNan.Afflictions.BoneFix) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.BoneFix, HF.GetAfflictionStrength(character, NTNan.Afflictions.BoneFix)))
    end

    --DeepFix
    if HF.HasAffliction(character, NTNan.Afflictions.DeepFix) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.DeepFix, HF.GetAfflictionStrength(character, NTNan.Afflictions.DeepFix)))
    end

    --OxyBlood
    if HF.HasAffliction(character, NTNan.Afflictions.OxyBlood) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.OxyBlood, HF.GetAfflictionStrength(character, NTNan.Afflictions.OxyBlood)))
    end

    --AntiTox
    if HF.HasAffliction(character, NTNan.Afflictions.AntiTox) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.AntiTox, HF.GetAfflictionStrength(character, NTNan.Afflictions.AntiTox)))
    end

    --Neural
    if HF.HasAffliction(character, NTNan.Afflictions.Neural) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.Neural, HF.GetAfflictionStrength(character, NTNan.Afflictions.Neural)))
    end

    if HF.HasAffliction(character, NTNan.Afflictions.Husk) then
        local tier = HF.GetAfflictionStrength(character, NTNan.Afflictions.Husk)

        if tier == 1 then
            if HF.GetAfflictionStrength(character, "huskinfection") > 80 then
                applyHeals(character, {"huskinfection", 2})
            end
        else
            applyHeals(character, {"huskinfection", 5})
        end
    end

end

