
clear; clc; close all

% this script allows you to view video-tracking data and 'maze zones'
% that will be used for making the 'Int' variable

% this script also allows you to modify/update coordinates for specific
% zones, which can then be copy/pasted into the corresponding
% 'whereishe_andrew' script (Lroom or Rroom depending) 


%% ~~~~~~~~ edit 'dir' & 'room' below

dir = 'X:\08. Lab personnel\Current\David\Projects\ArchT - Triregional Circuit\InactRec_ReCA1_DNMP\2. Output\Ephys\Data Entry\Francis\Delay1 - 8.16.17'  %Input field name

datafolder = strcat(dir);
%clear dir;

% to view current zone-designation:

% enter 1 for Right room (sideways), 2 for Left room (up-down), or 0 for room unknown
room = 1;


    

%% leave as is

%Load position data
load(strcat(datafolder,'\VT1.mat'));
TimeStamps = TimeStamps_VT;
pos_x = ExtractedX; pos_y = ExtractedY; pos_t = TimeStamps;
%clear ExtractedX ExtractedY TimeStamps



%% example for modifying 2-D fields below (important)


% exmpl_fld = [505 310 85 75];
% exmpl_fld = [lower x-coordinate, lower y-coord., quantity to add to lower x-coord., quantity to add to lower y-coord.]

% meaning a rectangle will extend sideways from x(505) to x(590), & will expand from y(310) to y(385)
    % because 505 + 85 = 580, and 310 + 75 = 385;
    

%% L room (up/down)
if room == 2; 

   % right reward zone (up/down room, L)
    rRW_fld = [485 290 65 100]; 
    
    % left reward zone (up/down room, L)
    lRW_fld = [145 290 65 100];
    
    % central stem (up/down room, L)
    STM_fld = [340 160 30 210];
    
    % delay pedestal (up/down room, L)
    PED_fld = [280 35 150 125];
    
    % choice point/T-junction (up/down room, L)
    CP_fld = [340 370 30 65];
    
    % Left Goal Arm 
    GAL_fld = [210 360 130 50];
    
    % Right Goal Arm 
    GAR_fld = [370 360 115 50];
    
    % Return Arm Left
    RAL_fld = [210 160 120 165];
    
    % Return Arm Right
    LAL_fld = [375 160 150 130];
    
    
    figure
    plot(ExtractedX, ExtractedY);
    
    rectangle ('position', rRW_fld);  %rRW
    rectangle ('position', lRW_fld);  %lRW
    rectangle ('position', STM_fld);  %Stem
    rectangle ('position', PED_fld);  % Box
    rectangle ('position', CP_fld);  %CP
    rectangle ('position', GAL_fld);  %GAL
    rectangle ('position', GAR_fld);  %GAR
    rectangle ('position', RAL_fld);  %RAL
    rectangle ('position', LAL_fld);  %LAL
    
%% R room (sideways)
elseif room == 1; 
    
    
    % right reward zone (sideways room, R)
    rRW_fld = [500 -10 100 85];
    
    % left reward zone (sideways room, R)
    lRW_fld = [510 410 90 90];
     
    % central stem (sideways room, R)
    STM_fld = [235 215 340 50];
    
    % delay pedestal (sideways room, R)
    PED_fld = [15 140 185 220];
    
    % choice point/T-junction (sideways room, R)
    CP_fld = [575 180 125 110];

    
    
    figure
    plot(ExtractedX, ExtractedY);
    
    rectangle ('position', rRW_fld);  %rRW
    rectangle ('position', lRW_fld);  %lRW
    rectangle ('position', STM_fld);  %Stem
    rectangle ('position', PED_fld);  % Box
    rectangle ('position', CP_fld);  %CP
    
    
    
%% room unknown
else 
    
figure
plot(ExtractedX, ExtractedY);
    
end







