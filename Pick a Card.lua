-- Shyvana
-- TwistedFate Pick a Card 1.000

local selected = "goldcardlock";
local LastPick, LastPick2 = 0, 0;
local myHero = GetMyHero();
local WREADY = false;

if GetObjectName(myHero) ~= "TwistedFate" then return end

PrintChat("<font color='#007DFF'>[Pick a Card] <font color='#FFFFFF'>Loaded</font>");

OnLoop(function(myHero)
	WREADY = CanUseSpell(myHero, _W);

	if WREADY == 0 and GetTickCount() - LastPick <= 2300 then
		if GetCastName(myHero, _W) == selected then
			CastSpell(_W);
		end
	end
	if WREADY == 0 and GetCastName(myHero, _W) == "PickACard" and GetTickCount() - LastPick2 >= 2400 and GetTickCount() - LastPick >= 500 then
		if KeyIsDown(32) then
			selected = "goldcardlock";
		elseif KeyIsDown(69) then 
			selected = "bluecardlock";
		elseif KeyIsDown(84) then
			selected = "redcardlock";
		else return
		end
		CastSpell(_W);
		LastPick = GetTickCount();
	end
end)

OnProcessSpell(function(Object, spellProc)
	if Object == myHero and spellProc.name == "PickACard" then
		LastPick2 = GetTickCount();
	end
end)