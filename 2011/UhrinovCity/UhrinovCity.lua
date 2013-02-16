--
-- SampleModMap
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
    return self;
end;

function UhrinovCity:delete()
    UhrinovCity:superClass().delete(self);
end;

function UhrinovCity:load()
    -- self.environment = Environment:new(Utils.getFilename("$data/sky/sky_day_night.i3d", self.baseDirectory), true, 8, true, true);
    self.environment = Environment:new(Utils.getFilename("sky/sky_day_night.i3d", self.baseDirectory), true, 8, true, true);
    
    -- load the map
    self:loadMap(Utils.getFilename("map/map.i3d", self.baseDirectory));
    
    -- load paths for AI traffic vehicles
    -- //self:loadMap(Utils.getFilename("map01/paths/trafficPaths.i3d", self.baseDirectory));
    
    -- load paths for AI pedestrians
    -- //self:loadMap(Utils.getFilename("map01/paths/pedestrianPaths.i3d", self.baseDirectory));
        
    AnimalHusbandry.initialize();
    self:loadMap(Utils.getFilename("$data/maps/missions/CattleMeadow.i3d", self.baseDirectory));
    
    -- load the PDA map image
    self.missionPDA:loadMap(Utils.getFilename("pda_map.png", self.baseDirectory));
    
    UhrinovCity:superClass().load(self);
    g_currentMission.missionPDA.worldSizeX = 8000;
    g_currentMission.missionPDA.worldSizeZ = 8000;
    g_currentMission.missionPDA.worldCenterOffsetX = g_currentMission.missionPDA.worldSizeX*0.5;
    g_currentMission.missionPDA.worldCenterOffsetZ = g_currentMission.missionPDA.worldSizeZ*0.5;

end
function UhrinovCity:loadFinished()
    UhrinovCity:superClass().loadFinished(self);
    AnimalHusbandry.finalize();
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