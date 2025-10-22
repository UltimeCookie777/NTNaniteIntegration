function NTNan.UpdateHuman(character)
    
    if HF.HasAffliction(character, NTNan.Afflictions.BoneFix) then
        HF.AddAffliction(character, "t_fracture", -6)
        HF.SetAffliction(character, "t_fracture", 0)
    end

end

