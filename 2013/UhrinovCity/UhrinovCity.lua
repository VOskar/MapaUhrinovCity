--
-- SampleModMap
--
-- @author  Stefan Geiger
-- @date  06/08/12
--
-- Copyright (C) GIANTS Software GmbH, Confidential, All Rights Reserved.

UhrinovCity = {}

local UhrinovCity_mt = Class(UhrinovCity, Mission00);


function UhrinovCity:new(baseDirectory, customMt)
    local mt = customMt;
    if mt == nil then
        mt = UhrinovCity_mt;
    end;
    local self = UhrinovCity:superClass():new(baseDirectory, mt);

--    self.playerStartX = 39;
--    self.playerStartY = 0.1;
--    self.playerStartZ = -330;
--    self.playerRotX = 0;
--    self.playerRotY = Utils.degToRad(90);

    return self;
end;

function UhrinovCity:delete()
    UhrinovCity:superClass().delete(self);
end;

function UhrinovCity:load()
    self:startLoadingTask();

    self.environment = Environment:new(Utils.getFilename("sky/sky_day_night.i3d", self.baseDirectory), true, 8, true, true);

    self.helpIconsBase = nil;
    self.collectableHorseshoesObject = nil;
    self.fieldDefinitionBase = nil;
    self.vehicleShopBase = nil;

    self:loadMap(Utils.getFilename("map/map.i3d", self.baseDirectory), true, self.loadMap01Finished, self);
end;

function UhrinovCity:loadMap01Finished(node, arguments)

    self:loadMapXMLFile(Utils.getFilename("UhrinovCity.xml", self.baseDirectory));

    self.missionPDA:loadMap(Utils.getFilename("pda_map.dds", self.baseDirectory), 8192, 8192);

    g_inGameMenu:setMapViewsMap(Utils.getFilename("minimap.dds", self.baseDirectory), 4912,4912);

    local iconSize = self.missionPDA.pdaMapWidth / 20;
    
    -- ATMs
    self.missionPDA:createMapHotspot("Bank", Utils.getFilename("$dataS2/missions/hud_pda_spot_bank.png", self.baseDirectory), 0, 0, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- Vehicle Shop
    self.missionPDA:createMapHotspot("Shop", Utils.getFilename("$dataS2/missions/hud_pda_spot_shop.png", self.baseDirectory), 100, 100, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- Phone Booths
    self.missionPDA:createMapHotspot("Phone", Utils.getFilename("$dataS2/missions/hud_pda_spot_phone.png", self.baseDirectory), 200, 200, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- egg sellpoints
    self.missionPDA:createMapHotspot("Eggs", Utils.getFilename("$dataS/missions/hud_pda_spot_eggs.png", self.baseDirectory), 300, 300, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- farm silos
    self.missionPDA:createMapHotspot("TipPlace", Utils.getFilename("$dataS2/missions/hud_pda_spot_tipPlace.png", self.baseDirectory), 400, 400, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- Grass Heaps
    self.missionPDA:createMapHotspot("TipPlace", Utils.getFilename("$dataS2/missions/hud_pda_spot_tipPlaceGreen.png", self.baseDirectory), 500 , 500, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- livestock
    self.missionPDA:createMapHotspot("Cows", Utils.getFilename("$dataS2/missions/hud_pda_spot_cows.png", self.baseDirectory), 600, 600, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    -- spinnery
    g_currentMission.missionPDA:createMapHotspot("woolDeliveryHotspot", Utils.getFilename("$dataS/missions/hud_pda_spot_spinnery.png", self.baseDirectory), 700, 700, iconSize, iconSize * (4 / 3), false, false, false, 0, true);

    UhrinovCity:superClass().load(self);

    if not self.missionDynamicInfo.isMultiplayer then
        self:updateFoundHorseshoes();
        self:updateFoundHelpIcons();
        self:updateMeteoriteCrash();
        self:updateRainbow();
    else
        self:removeAllHorseshoes();
        self:removeAllHelpIcons();
    end;
    
    if g_isGamescomVersion then
        self:playerOwnsAllFields();
    end;

    self:finishLoadingTask();
end;

function UhrinovCity:onStartMission()
    UhrinovCity:superClass().onStartMission(self);
end;

function UhrinovCity:mouseEvent(posX, posY, isDown, isUp, button)
    UhrinovCity:superClass().mouseEvent(self, posX, posY, isDown, isUp, button);
end;

function UhrinovCity:keyEvent(unicode, sym, modifier, isDown)
    UhrinovCity:superClass().keyEvent(self, unicode, sym, modifier, isDown);
end;

function UhrinovCity:update(dt)
    UhrinovCity:superClass().update(self, dt);
end;

function UhrinovCity:draw()
    UhrinovCity:superClass().draw(self);
end;