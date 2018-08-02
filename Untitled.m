clear;
clc;
%% Convert files to MatLab-readable format

        % set folder to draw from
        datafolder = 'H:\Classwork Files\2017\Spring\Spatial Cognition\Project\1101-09';

        % load VT
        [TimeStamps, ExtractedX, ExtractedY, ExtractedAngle, Header] = Nlx2MatVT(strcat(datafolder,'\VT1.nvt'), [1 1 1 1 0 0], 1, 1, []);
            Header_VT = Header; clear Header;
            TimeStamps_VT = TimeStamps; clear TimeStamps;
                save(strcat(datafolder,'\VT1.mat'));
                clearvars -except datafolder

        % load Events
        [TimeStamps, EventIDs, TTls, Extras, EventStrings, Header] = Nlx2MatEV(strcat(datafolder,'\events.nev'), [1 1 1 1 1], 1, 1, [] );
            Header_EV = Header; clear Header;
            TimeStamps_EV = TimeStamps; clear TimeStamps;
                save(strcat(datafolder,'\Events.mat'));
                clearvars -except datafolder 

        % CSC's
        % 1
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc6.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC6 = Header; clear Header;
                save(strcat(datafolder,'\CSC6.mat'));
                clearvars -except datafolder
        catch
        end;
        
%% Generate Int file for task-phase binning      
   
        load(strcat(datafolder,'\VT1.mat'));
        TimeStamps = TimeStamps_VT;
        pos_x = ExtractedX; pos_y = ExtractedY; pos_t = TimeStamps;
        clear ExtractedX ExtractedY TimeStamps

        %Load event strings
        load(strcat(datafolder,'\Events.mat'));
        TimeStamps = TimeStamps_EV;

        %Define the beginning and end of the session
        %If event timestamps for beginning and end of session differ from those defined in this script, manually input event timestamp values

        % ~~~~~~~~~ EDIT THIS SECTION IF ENCOUNTER ERROR ~~~~~~~~~~~~~~~~~~~~~~~~~

        start = TimeStamps (1,1); % may need to change to (1,3) or (1,5)
        finish = TimeStamps(1,2); % may need to change to (1,4) or (1,6)
        
        %
        Int = [];

        clear EventStrings TimeStamps

        %Define the Int variable
        ind = find(pos_t>start & pos_t<finish);
        pos_t1=pos_t(ind); pos_x1=pos_x(ind); pos_y1=pos_y(ind);
        [Int] = whereishe_andrew(pos_x1,pos_y1,pos_t1);

        Int_ind = find(Int(:,1)>start & Int(:,8)<finish);
        starttrials = Int_ind(1,1);
        endtrials = Int_ind(end);
        Int = Int(1:endtrials,:);

        save(strcat(datafolder,'\Int_new.mat'),'Int');

%% Adjust Matrices and Timestamps to 1xN Vectors

        load (strcat(datafolder,'\CSC6.mat'));
        CSC6_New = Samples(:)';
        
%% Link signal with task-phase bins (time bins)

Int_1st = Int(1:2:end-1,:); % asking for the timestamps of every odd traversal for all "important" time landmarks (i.e. sample-run landmarks
Int_2nd = Int(2:2:end,:); % asking for the timestamps of every even traversal for all "important" time landmarks (i.e. choice-run landmarks

for i = 1
   for j = 1:size(Int_1st,1); % for every iteration 'j', where the iteration is the number of rows in the stipulated variable, with only 1 column
   CSC1st(i) = CSC_New(Timestamps > Int_1st(j,2) & Timestamps < Int_1st (j,7)); %Reward zone
   Reward1{i,j}=CSC1st(i);
   end
end
%% Setting Chronux params

cd 'X:\03. Lab Procedures and Protocols\MATLABToolbox\chronux\spectral_analysis\continuous';

% params are values that are necessary as input for chronus analyse
params.fpass = [150 200]; % essentially a bandpass filter that restricts to 1-100Hz within the signal
params.Fs = 2000; % sampling rate; or 2034 if right room
params.trialave = 0; % or 1
params.tapers = [3 5]; % taper of 5...but look into this more
params.pad = 0; % adds padding of zeros on either side of the selected chunk of signal
params.serr = [2 .05]; % sampling error bars, where 2 is jackknife