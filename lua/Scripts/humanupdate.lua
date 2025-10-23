function NTNan.UpdateHuman(character)
        
    local aff = NTNan.GetAllNanAfflictions(character)

    if aff == {} or aff == nil then return end

    local function hasEnoughPrecursors(character)
    
        local nanitesCount = 0
        for k,v in pairs(aff) do
            if v == NTNan.Afflictions.Remover or v == NTNan.Afflictions.Precursor then
                goto continue
            end

            if v == NTNan.Afflictions.OxyBlood then
                nanitesCount = nanitesCount + 2
                goto continue
            end

            nanitesCount = nanitesCount + 1
            ::continue::
        end

        if nanitesCount == 0 then return true end

        if not HF.HasAffliction(character, NTNan.Afflictions.Precursor) then
            return false
        end

        local precursorCount = math.floor(HF.GetAfflictionStrength(character, NTNan.Afflictions.Precursor))
        if nanitesCount > precursorCount then
            return false
        end

        return true
    end

    local function applyHeals(character, healStats)

        for k,hl in pairs(healStats)do
            
            local affName = hl[1]
            local str = hl[2]
            local isLocal = hl[3]

            if isLocal == nil then
                HF.AddAffliction(character, affName, -1*str*NT.Deltatime)
            else
                for _,limb in pairs(NTNan.Limbs) do
                    HF.AddAfflictionLimb(character, affName, limb, -1*str*NT.Deltatime)
                end
                
            end
        end

    end

    if not hasEnoughPrecursors(character) then
        for _,val in pairs(aff) do
            HF.SetAffliction(character, val, 0)

            if val == NTNan.Afflictions.Reconstructor then
                for _,limb in pairs(NTNan.Limbs) do
                    print(limb)
                    HF.AddAfflictionLimb(character, "burn", limb, 10)
                end
                
            elseif val == NTNan.Afflictions.DeepFix then
                HF.AddAffliction(character, "organdamage", 60)
            elseif val == NTNan.Afflictions.BoneFix then
                for _,limb in pairs(NTNan.Limbs) do
                    HF.AddAfflictionLimb(character, "bonedamage", limb, 80)
                end
            elseif val == NTNan.Afflictions.OxyBlood then
                HF.AddAffliction(character, "cardiacarrest", 10)
                HF.AddAffliction(character, "oxygenlow", 100)
            elseif val == NTNan.Afflictions.Husk then
                HF.AddAffliction(character, "t_fracture", 50)
            elseif val == NTNan.Afflictions.Neural then
                HF.AddAffliction(character, "stun", 100)
                HF.AddAffliction(character, "opiateaddiction", 100)
            elseif val == NTNan.Afflictions.AntiTox then
                HF.AddAffliction(character, "drunk", 60)
                HF.AddAffliction(character, "paralysis", 50)
            elseif val == NTNan.Afflictions.VigorBuff then
                HF.AddAffliction(character, "ra_fracture", 50)
                HF.AddAffliction(character, "la_fracture", 50)
            elseif val == NTNan.Afflictions.HyperBuff then
                HF.AddAffliction(character, "rl_fracture", 50)
                HF.AddAffliction(character, "ll_fracture", 50)
            elseif val == NTNan.Afflictions.VisionBuff then
                HF.AddAffliction(character, "psychosis", 100)
            end
        end
        return
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

    --MechFix
    if HF.HasAffliction(character, NTNan.Afflictions.Mechfix) then
        applyHeals(character, NTNan.GetAfflictionResistances(NTNan.Afflictions.Mechfix, HF.GetAfflictionStrength(character, NTNan.Afflictions.Mechfix)))
    end

    --Husk
    if HF.HasAffliction(character, NTNan.Afflictions.Husk) then
        
        local tier = HF.GetAfflictionStrength(character, NTNan.Afflictions.Husk)

        if HF.HasAffliction(character, "huskinfection") then
            if math.floor(tier) == 1 then
                if HF.GetAfflictionStrength(character, "huskinfection") > 80 then
                    applyHeals(character, {{"huskinfection", 1}})
                end
            else
                applyHeals(character, {{"huskinfection", 5}})
            end
        end
    end

    --Remover
    if HF.HasAffliction(character, NTNan.Afflictions.Remover) then
        for _,val in pairs(aff) do
            if not (val == NTNan.Afflictions.Precursor) then
                HF.SetAffliction(character, val, 0)
            end
        end
    end
end

