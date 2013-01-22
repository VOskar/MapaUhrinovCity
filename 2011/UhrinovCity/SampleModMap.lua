--
-- SampleModMap
--
-- Copyright (C) GIANTS Software GmbH, Confidential, All Rights Reserved.

SampleModMap = {}

local SampleModMap_mt = Class(SampleModMap, Mission00);

function SampleModMap:new(baseDirectory, customMt)
    local mt = customMt;
    if mt == nil then
        mt = SampleModMap_mt;
    end;
    local self = SampleModMap:superClass():new(baseDirectory, mt);
    return self;
end;

function SampleModMap:delete()
    SampleModMap:superClass().delete(self);
end;

function SampleModMap:load()
    -- self.environment = Environment:new(Utils.getFilename("$data/sky/sky_day_night.i3d", self.baseDirectory), true, 8, true, true);
    self.environment = Environment:new(Utils.getFilename("sky/sky_day_night.i3d", self.baseDirectory), true, 8, true, true);
    
    -- load the map
    self:loadMap(Utils.getFilename("map01.i3d", self.baseDirectory));
    
    -- load paths for AI traffic vehicles
    -- //self:loadMap(Utils.getFilename("map01/paths/trafficPaths.i3d", self.baseDirectory));
    
    -- load paths for AI pedestrians
    -- //self:loadMap(Utils.getFilename("map01/paths/pedestrianPaths.i3d", self.baseDirectory));
        
    AnimalHusbandry.initialize();
    self:loadMap(Utils.getFilename("$data/maps/missions/CattleMeadow.i3d", self.baseDirectory));
    
    -- load the PDA map image
    self.missionPDA:loadMap(Utils.getFilename("map01/pda_map.png", self.baseDirectory));
    
    SampleModMap:superClass().load(self);
    g_currentMission.missionPDA.worldSizeX = 8000;
    g_currentMission.missionPDA.worldSizeZ = 8000;
    g_currentMission.missionPDA.worldCenterOffsetX = g_currentMission.missionPDA.worldSizeX*0.5;
    g_currentMission.missionPDA.worldCenterOffsetZ = g_currentMission.missionPDA.worldSizeZ*0.5;

end
function SampleModMap:loadFinished()
    SampleModMap:superClass().loadFinished(self);
    AnimalHusbandry.finalize();
end;

function SampleModMap:mouseEvent(posX, posY, isDown, isUp, button)
    SampleModMap:superClass().mouseEvent(self, posX, posY, isDown, isUp, button);
end;

function SampleModMap:keyEvent(unicode, sym, modifier, isDown)
    SampleModMap:superClass().keyEvent(self, unicode, sym, modifier, isDown);
end;

function SampleModMap:update(dt)
    SampleModMap:superClass().update(self, dt);
end;

function SampleModMap:draw()
    SampleModMap:superClass().draw(self);
end;