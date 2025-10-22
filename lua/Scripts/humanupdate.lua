function NTNan.UpdateHuman(character)
    
    local aff = NTNan.GetAllNanAfflictions(character)

    local function applyHeals(character, resistances)

        for _,res in pairs(resistances)do
            print("aa")
            for k,v in pairs(res) do
                print(k.." = "..v)
            end
            
            
            local affName = res[0]
            local str = res[1]

            HF.AddAffliction(character, affName, -str)

        end

    end

    if HF.HasAffliction(character, "reconstructornanite") then
        print(HF.GetAfflictionStrength(character, "reconstructornanite"))
        print(NTNan.GetAfflictionResistances("reconstructornanite", HF.GetAfflictionStrength(character, "reconstructornanite")))
        applyHeals(character, NTNan.GetAfflictionResistances("reconstructornanite", HF.GetAfflictionStrength(character, "reconstructornanite")))
    end

end

