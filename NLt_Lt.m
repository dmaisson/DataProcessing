%% Separating CSCs from TaskPhases with/without Light
NoLight={1 2 3 4 5 6 13 14 15 16 17 18}; %Enter trial numbers of no light runs
Light={7 8 9 10 11 12 19 20 21 22 23 24}; %Enter trial numbers of light runs

% break out CSC from delay phase by light condition
for i = 1:16;% adjust
    for j = 1:length(Light);
        DelayLight{i,j}=DDelay{i,Light{1,j}};
%         DelayTimesLight{i,j}=DDelayTimes{i,Light{1,j}};
    end
end

for i = 1:16;%adjust
    for j = 1:length(NoLight);
        DelayNoLight{i,j}=DDelay{i,NoLight{1,j}};
%         DelayTimesNoLight{i,j}=DDelayTimes{i,NoLight{1,j}};
    end
end