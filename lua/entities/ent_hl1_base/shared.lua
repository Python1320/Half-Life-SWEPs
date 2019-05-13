ENT.Type			= "anim"
ENT.PrintName		= "HL1 Ent Base"
ENT.Author			= "Upset"

function ENT:IsMultiplayerRules()
	return (!game.SinglePlayer() or cvars.Bool("hl1_sv_mprules")) and !(GAMEMODE.Cooperative and !cvars.Bool("hl1_sv_mprules"))
end

function ENT:ImpactEffect(tr)
	if !IsFirstTimePredicted() then return end
	local e = EffectData()
	e:SetOrigin(tr.HitPos)
	e:SetStart(tr.StartPos)
	e:SetSurfaceProp(tr.SurfaceProps)
	e:SetDamageType(DMG_BULLET)
	e:SetHitBox(tr.HitBox)
	if CLIENT then
		e:SetEntity(tr.Entity)
	else
		e:SetEntIndex(tr.Entity:EntIndex())
	end
	
	local effect = "Impact"
	if tr.Entity:IsNPC() or tr.Entity:IsPlayer() then
		effect = "BloodImpact"
	end

	util.Effect(effect, e, true, true)
end