-- -------------------------------------------------------------------------- --
-- SAUSAGE STRAT - WARMANE EDITION
-- Author: Sausage Party
-- Version: 1.0
-- -------------------------------------------------------------------------- --

local SAUSAGE_VERSION = "1.0"
local ADDON_NAME = "SausageStrat"

-- Colors
local C_TANK = {r=1, g=0.8, b=0}   -- Gold
local C_HEAL = {r=0, g=0.7, b=1}   -- Blue
local C_DPS  = {r=1, g=0.2, b=0.2} -- Red
local C_MECH = {r=0.6, g=0.6, b=0.6} -- Gray
local C_ALT  = {r=0, g=1, b=0}     -- Green

-- -------------------------------------------------------------------------- --
-- DATA STRUCTURE
-- -------------------------------------------------------------------------- --
local SausageDB = {
    ["Naxx10"] = {},    -- Populated below
    ["Naxx25"] = {},    -- WIP
    ["Heroics"] = {}    -- WIP
}

-- NAXX 10 DATA (Final Approved)
SausageDB["Naxx10"] = {
    { category = "Spider Wing", name = "Anub'Rekhan",
      mech = "Locust Swarm (AoE silence + slow). Impale (Knock up).",
      tank = "Tank in center. During Locust Swarm (3s cast), use def CD and kite along outer circle.",
      heal = "Run IN FRONT of Tank during kiting to avoid Silence.",
      dps = "mDPS: Focus Crypt Guards (Stun). rDPS: Stay away during Swarm.",
      alt = "Speed Kite: Tank uses Swiftness Potion right before Swarm to outrun boss." },
      
    { category = "Spider Wing", name = "Grand Widow Faerlina",
      mech = "Enrage (Atk Spd/Dmg up). Rain of Fire. Poison Bolt Volley.",
      tank = "MT holds Boss. OT holds Worshippers away.",
      heal = "Dispel Poison Bolt Volley ASAP.",
      dps = "Don't kill Worshippers early! When Enraged, kill Worshipper NEAR her to remove Enrage.",
      alt = "Burn Strat: Ignore Enrage. Heroism on pull, nuke her. OT holds adds." },
      
    { category = "Spider Wing", name = "Maexxna",
      mech = "Web Spray (Stun 6s). Web Wrap (Cocoon).",
      tank = "Solo tank. Keep HoTs active. Use heavy CDs before Web Spray.",
      heal = "Top off Tank to 100% before Web Spray.",
      dps = "mDPS: AoE spiderlings. rDPS (Mage/Hunter): KILL WEB WRAP immediately!",
      alt = nil },

    { category = "Plague Wing", name = "Noth the Plaguebringer",
      mech = "Teleport to Balcony (Adds) -> Blink back (Aggro reset).",
      tank = "Tank boss. Taunt immediately after Blink or wipe.",
      heal = "Decurse (Mage/Druid): Priority #1. Curse = Wipe.",
      dps = "Kill Adds. Stop DPS during teleport. rDPS: Decurse.",
      alt = nil },

    { category = "Plague Wing", name = "Heigan the Unclean",
      mech = "Safety Dance (Eruptions 1-2-3-4).",
      tank = "Move boss on floor. Keep boss in range of platform.",
      heal = "Stand on Starting Platform (Safe spot). Dispel Decrepit Fever.",
      dps = "mDPS: Dance with Tank. rDPS: Stand on Starting Platform (Ignore dance).",
      alt = nil },

    { category = "Plague Wing", name = "Loatheb",
      mech = "Necrotic Aura (No heal 17s), Spores (Crit buff).",
      tank = "Tank & Spank. Dodge Spores.",
      heal = "3-sec healing window every 20s. Pre-cast big heals.",
      dps = "Kill Spore, stand in it for Crit buff. Rotate CDs.",
      alt = nil },

    { category = "Military Wing", name = "Instructor Razuvious",
      mech = "Boss hits 30k+. Requires MC.",
      tank = "Use MC Crystal on Understudy 1. Use Bone Barrier to tank boss.",
      heal = "Focus heal the Mind Controlled Understudy.",
      dps = "Full DPS on boss. OT keeps 2nd Understudy aside/CC.",
      alt = "MC Refresh: Dismiss and re-MC pet every 2 Bone Barriers." },

    { category = "Military Wing", name = "Gothik the Harvester",
      mech = "Live Side (Adds) -> Dead Side (Souls). Gate opens Wave 10.",
      tank = "Split: 1 Live, 1 Dead side.",
      heal = "Split: 1 Live, 1 Dead side.",
      dps = "Split evenly. Live kills slow, Dead kills fast.",
      alt = "AoE Strat: Everyone on LIVE SIDE. Ignore Dead. Wave 10: Tank grabs all, AoE nuke." },

    { category = "Military Wing", name = "The Four Horsemen",
      mech = "Marks stack. Meteor (Split dmg). Void Zones.",
      tank = "Tank Korth'azz & Rivendare. Swap at 3 stacks.",
      heal = "Front: Solos raid healing. Back: Heals self + Soaker.",
      dps = "Korth'azz -> Rivendare -> Back bosses.",
      alt = "Stack Strat: Stack heavily on Korth'azz (Front-Left) to split Meteor. Burst with Heroism." },

    { category = "Construct Wing", name = "Patchwerk",
      mech = "Gear check. Hateful Strike hits high HP off-target.",
      tank = "MT: Melee. OT (High HP): Soaks Hateful Strike.",
      heal = "Assignments: Assign specific healers to MT and OT. Pump mana!",
      dps = "Full burst. Watch Omen.",
      alt = "Slime Dip: mDPS dip in slime to 50% HP to avoid Hateful Strike." },

    { category = "Construct Wing", name = "Grobbulus",
      mech = "Poison Cloud (Expanding). Mutating Injection.",
      tank = "Kite clockwise. Drop clouds behind.",
      heal = "DO NOT DISPEL EARLY! Wait for player to run to wall.",
      dps = "Injection: Run to wall behind boss. Wait for dispel.",
      alt = nil },

    { category = "Construct Wing", name = "Gluth",
      mech = "Decimate (HP to 5%). Zombies heal boss.",
      tank = "Swap at 3 stacks Mortal Wound.",
      heal = "Prepare for Decimate -> Instant AoE heal.",
      dps = "Mage/Hunter kite Zombies. At Decimate: AoE Zombies instantly.",
      alt = nil },

    { category = "Construct Wing", name = "Thaddius",
      mech = "Polarity Shift (+/-). Same charge stacks dmg.",
      tank = "P1: Add. P2: Boss. OT goes DPS in P2.",
      heal = "Don't cross players with wrong charge.",
      dps = "Polarity: Left (-), Right (+). If charge changes, run LEFT (Clockwise).",
      alt = nil },

    { category = "Frost Wyrm Lair", name = "Sapphiron",
      mech = "Frost Aura (AoE), Ice Block (LoS), Breath.",
      tank = "Turn boss sideways.",
      heal = "Heavy AoE healing.",
      dps = "rDPS: Spread 15y (Blizzard). Air Phase: Hide behind Ice Block.",
      alt = nil },

    { category = "Frost Wyrm Lair", name = "Kel'Thuzad",
      mech = "Frost Blast (Ice Cube), Fissure, Detonate Mana.",
      tank = "P1: Aboms. P2: KT. P3: Guardians. Square formation.",
      heal = "Spread circle. Focus heal Frost Blast targets.",
      dps = "Spread 12y. Interrupt Frostbolt (ST). P1: mDPS Aboms, rDPS Banshees.",
      alt = nil }
}

-- WIP DATA
SausageDB["Naxx25"] = {
    { category = "Info", name = "WORK IN PROGRESS", mech = "Naxxramas 25 strategies are under construction.", tank="Coming soon.", heal="Coming soon.", dps="Coming soon." }
}
SausageDB["Heroics"] = {
    { category = "Info", name = "WORK IN PROGRESS", mech = "Heroic Dungeon guides are under construction.", tank="Coming soon.", heal="Coming soon.", dps="Coming soon." }
}

-- -------------------------------------------------------------------------- --
-- VARIABLES & INIT
-- -------------------------------------------------------------------------- --
local currentMode = "Naxx10"
local currentIndex = 1
local mainFrame = SausageStratMainFrame
tinsert(UISpecialFrames, "SausageStratMainFrame")

-- -------------------------------------------------------------------------- --
-- CHAT & WHISPER SYSTEM
-- -------------------------------------------------------------------------- --
local function GetChatTarget()
    if UnitInRaid("player") then return "RAID"
    elseif GetNumPartyMembers() > 0 then return "PARTY"
    else return "SAY" end
end

local function SendReport(msg, isWhisper)
    if not msg or msg == "" then return end
    
    -- Prefix for branding
    local prefix = "[Sausage]: "
    local fullMsg = prefix .. msg

    if isWhisper then
        local target = UnitName("target")
        if target and UnitIsPlayer("target") and UnitIsFriend("player", "target") then
            SendChatMessage(fullMsg, "WHISPER", nil, target)
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Target a friendly player to whisper.|r")
        end
    else
        local channel = GetChatTarget()
        SendChatMessage(fullMsg, channel)
    end
end

-- -------------------------------------------------------------------------- --
-- UI BUILDER
-- -------------------------------------------------------------------------- --
local function CreateContentSection(parent, title, color, yOffset, typeKey)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(550, 80)
    frame:SetPoint("TOP", parent, "TOP", 0, yOffset)
    
    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropBorderColor(color.r, color.g, color.b, 1)
    frame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)

    -- Title Label
    local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    label:SetPoint("TOPLEFT", 10, -10)
    label:SetText(title)

    -- Content Text
    local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    text:SetPoint("TOPLEFT", 10, -25)
    text:SetPoint("BOTTOMRIGHT", -35, 10) 
    text:SetJustifyH("LEFT")
    text:SetJustifyV("TOP")
    
    -- "Share Section" Button (Small Chat Icon)
    local btnShare = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    btnShare:SetSize(20, 20)
    btnShare:SetPoint("TOPRIGHT", -5, -5)
    btnShare:SetText("S")
    btnShare:SetScript("OnEnter", function(self) 
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Click to Share this section")
        GameTooltip:Show()
    end)
    btnShare:SetScript("OnLeave", function() GameTooltip:Hide() end)
    btnShare:SetScript("OnClick", function()
        local data = SausageDB[currentMode][currentIndex]
        if data then
            SendReport(title .. ": " .. (data[typeKey] or "N/A"), false)
        end
    end)

    return frame, text
end

-- Content Frame Container
local contentFrame = CreateFrame("Frame", nil, mainFrame)
contentFrame:SetSize(560, 450)
contentFrame:SetPoint("TOP", 0, -80)

local sections = {}
sections.tank = { CreateContentSection(contentFrame, "TANK", C_TANK, 0, "tank") }
sections.heal = { CreateContentSection(contentFrame, "HEALER", C_HEAL, -85, "heal") }
sections.dps  = { CreateContentSection(contentFrame, "DPS", C_DPS, -170, "dps") }
sections.mech = { CreateContentSection(contentFrame, "MECHANICS", C_MECH, -255, "mech") }
sections.alt  = { CreateContentSection(contentFrame, "ALTERNATIVE", C_ALT, -340, "alt") }

local bossTitle = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
bossTitle:SetPoint("TOP", 0, -50)

-- -------------------------------------------------------------------------- --
-- DROPDOWNS & NAVIGATION
-- -------------------------------------------------------------------------- --
-- Mode Dropdown (Naxx10 / Naxx25 / HC)
local modeDropDown = CreateFrame("Frame", "SausageModeDD", mainFrame, "UIDropDownMenuTemplate")
modeDropDown:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 0, -25)

-- Boss Dropdown
local bossDropDown = CreateFrame("Frame", "SausageBossDD", mainFrame, "UIDropDownMenuTemplate")
bossDropDown:SetPoint("TOPLEFT", modeDropDown, "TOPRIGHT", -20, 0)

-- Update Text Function
local function UpdateDisplay()
    local data = SausageDB[currentMode][currentIndex]
    
    bossTitle:SetText(data.name)
    
    sections.tank[2]:SetText(data.tank or "N/A")
    sections.heal[2]:SetText(data.heal or "N/A")
    sections.dps[2]:SetText(data.dps or "N/A")
    sections.mech[2]:SetText(data.mech or "N/A")
    
    if data.alt then
        sections.alt[1]:Show()
        sections.alt[2]:SetText(data.alt)
    else
        sections.alt[1]:Hide()
    end
    
    UIDropDownMenu_SetText(modeDropDown, currentMode)
    UIDropDownMenu_SetText(bossDropDown, data.name)
end

-- Dropdown Logic
local function InitModeMenu(self, level)
    local info = UIDropDownMenu_CreateInfo()
    local modes = {"Naxx10", "Naxx25", "Heroics"}
    for _, mode in ipairs(modes) do
        info.text = mode
        info.func = function(self)
            currentMode = self.value
            currentIndex = 1
            UpdateDisplay()
        end
        info.value = mode
        info.checked = (currentMode == mode)
        UIDropDownMenu_AddButton(info, level)
    end
end

local function InitBossMenu(self, level)
    local info = UIDropDownMenu_CreateInfo()
    local list = SausageDB[currentMode]
    
    if #list == 1 then -- For WIP sections
        info.text = list[1].name
        info.value = 1
        info.func = function() end
        info.checked = true
        UIDropDownMenu_AddButton(info, level)
        return
    end

    -- Group by Category (Wing)
    local lastCat = ""
    for i, data in ipairs(list) do
        if data.category ~= lastCat then
            info.text = data.category
            info.isTitle = true
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)
            lastCat = data.category
        end
        
        info = UIDropDownMenu_CreateInfo()
        info.text = data.name
        info.value = i
        info.func = function(self)
            currentIndex = self.value
            UpdateDisplay()
        end
        info.checked = (currentIndex == i)
        UIDropDownMenu_AddButton(info, level)
    end
end

UIDropDownMenu_Initialize(modeDropDown, InitModeMenu)
UIDropDownMenu_Initialize(bossDropDown, InitBossMenu)

-- -------------------------------------------------------------------------- --
-- GLOBAL ACTION BUTTONS (Footer)
-- -------------------------------------------------------------------------- --

-- Whisper Target Button
local btnWhisper = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
btnWhisper:SetSize(120, 25)
btnWhisper:SetPoint("BOTTOMLEFT", 140, 12)
btnWhisper:SetText("Whisper Target")
btnWhisper:SetScript("OnClick", function()
    local data = SausageDB[currentMode][currentIndex]
    if not data then return end
    -- Whisper priority: Mechanics first
    SendReport("Strat for " .. data.name .. ": " .. data.mech, true)
    if data.alt then SendReport("Alt: " .. data.alt, true) end
end)

-- Broadcast Button (Raid/Party)
local btnBroadcast = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
btnBroadcast:SetSize(120, 25)
btnBroadcast:SetPoint("BOTTOMLEFT", btnWhisper, "BOTTOMRIGHT", 10, 0)
btnBroadcast:SetText("Broadcast Strat")
btnBroadcast:SetScript("OnClick", function()
    local data = SausageDB[currentMode][currentIndex]
    if not data then return end
    -- Broadcast Mechanics and Alt strat to save chat space
    SendReport("Strat for " .. data.name, false)
    SendReport("Mech: " .. data.mech, false)
    if data.alt then SendReport("Cheese/Alt: " .. data.alt, false) end
end)

-- Footer Branding
local ver = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ver:SetPoint("BOTTOMLEFT", 20, 18)
ver:SetText("v" .. SAUSAGE_VERSION)

local credit = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
credit:SetPoint("BOTTOM", 0, 45) -- Slightly higher
credit:SetText("Sausage Party Addons")

-- -------------------------------------------------------------------------- --
-- MINIMAP
-- -------------------------------------------------------------------------- --
local mm = CreateFrame("Button", "SausageStratMinimap", Minimap)
mm:SetSize(32, 32)
mm:SetFrameStrata("MEDIUM")
mm:SetPoint("CENTER", -60, -60)
mm:SetMovable(true)
mm:EnableMouse(true)
mm:RegisterForDrag("RightButton")
mm:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

local icon = mm:CreateTexture(nil, "BACKGROUND")
icon:SetTexture("Interface\\Icons\\Inv_Misc_Food_54")
icon:SetSize(20, 20)
icon:SetPoint("CENTER")

local border = mm:CreateTexture(nil, "OVERLAY")
border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
border:SetSize(54, 54)
border:SetPoint("TOPLEFT")

mm:SetScript("OnDragStart", function(self) self:StartMoving() end)
mm:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
mm:SetScript("OnClick", function()
    if mainFrame:IsShown() then mainFrame:Hide() else mainFrame:Show() end
end)

-- Initial Load
UpdateDisplay()