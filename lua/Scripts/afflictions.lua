NTNan.Afflictions = {}
NTNan.AfflictionsRes = {}

NTNan.Afflictions.Precursor = "precursor"
NTNan.Afflictions.Decay = "nanitedecay"
NTNan.Afflictions.Reconstructor = "reconstructornanite"
NTNan.Afflictions.DeepFix = "deepfixnanite"
NTNan.Afflictions.BoneFix = "bonefixnanite"
NTNan.Afflictions.OxyBlood = "oxybloodnanite"
NTNan.Afflictions.Husk = "husknanite"
NTNan.Afflictions.Neural = "neuralnanite"
NTNan.Afflictions.AntiTox = "antitoxnanite"
NTNan.Afflictions.VigorBuff = "vigorbuffnanite"
NTNan.Afflictions.HyperBuff = "hyperbuffnanite"
NTNan.Afflictions.VisionBuff = "visionbuffnanite"
NTNan.Afflictions.LaniusXeno = "laniusxenonanite"

NTNan.AfflictionsRes[NTNan.Afflictions.Reconstructor] = { name = NTNan.Afflictions.Reconstructor, levels = {
    {{"burn", 0.3, true},{"acidburn",0.15, true},{"lacerations",0.3, true}},
    {{"bleeding",0.5, true},{"bleedingnonstop",0.5, true},{"bitewounds",0.3, true}},
    {{"gunshotwounds",0.2, true}}}
}

NTNan.AfflictionsRes[NTNan.Afflictions.BoneFix] = { name = NTNan.Afflictions.BoneFix, levels = {
    {{"blunttrauma", 0.4, true},{"ra_fracture", 10}, {"la_fracture", 3}},
    {{"rl_fracture", 3},{"ll_fracture", 3},{"t_fracture",3}},
    {{"n_fracture", 3},{"h_fracture",3},{"t_paralysis",1},{"bonedamage",0.5, true}}}
}

NTNan.AfflictionsRes[NTNan.Afflictions.DeepFix] = { name = NTNan.Afflictions.DeepFix, levels = {
    {{"internalbleeding", 0.25},{"foreignbody", 0.2, true}},
    {{"organdamage", 0.1},{"liverdamage",0.05},{"heartdamage",0.05},{"lungdamage",0.05},{"kidneydamage",0.05},{"liverdamage",0.05}}}
}

NTNan.AfflictionsRes[NTNan.Afflictions.OxyBlood] = {name=NTNan.Afflictions.OxyBlood, levels = {
    {{"bloodloss", 0.2},{"stun", 1.1},{"oxygenlow",0.4},{"radiationsickness",0.2},{"hypoxemia",0.3}}}
}

NTNan.AfflictionsRes[NTNan.Afflictions.AntiTox] = {name=NTNan.Afflictions.AntiTox, levels = {
    {{"drunk",0.5},{"opiateoverdose",1},{"morbusinepoisoning",1.2},{"deliriumpoisoning",1.2},{"sufforinpoisoning",2.1},{"cyanidepoisoning",1.1},{"paralysis",1.1}}}
}

NTNan.AfflictionsRes[NTNan.Afflictions.Neural] = {name=NTNan.Afflictions.Neural, levels = {
    {{"psychosis",0.2},{"hallucinating",0.2},{"fibrillation",1}},
    {{"opiateaddiction",0.2},{"chemaddiction",0.2},{"cerebralhypoxia",0.15},{"cardiacarrest",2}}}
}

