clear; 
clc;
%% Convert files to MatLab-readable format

        % set folder to draw from
        datafolder = 'X:\08. Lab personnel\Current\David\Projects\Ephys\HC Modulation - Re_Vs_dcMEC LFP\2. Output\Ephys\Johannes\2';

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
        %1
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc1.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC2 = Header; clear Header;
                save(strcat(datafolder,'\CSC1.mat'));
                clearvars -except datafolder
        catch
        end
        % 2
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc2.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC2 = Header; clear Header;
                save(strcat(datafolder,'\CSC2.mat'));
                clearvars -except datafolder
        catch
        end
        % 3
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc3.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC3 = Header; clear Header;
                save(strcat(datafolder,'\CSC3.mat'));
                clearvars -except datafolder
        catch
        end
        % 4
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc4.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC4 = Header; clear Header;
                save(strcat(datafolder,'\CSC4.mat'));
                clearvars -except datafolder
        catch
        end
        % 5
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc5.ncs'), [1 1 1 1 1], 1, 1, []);
             Header_CSC5 = Header; clear Header;
                save(strcat(datafolder,'\CSC5.mat'));
                clearvars -except datafolder
        catch
        end
        % 6
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc6.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC6 = Header; clear Header;
                save(strcat(datafolder,'\CSC6.mat'));
                clearvars -except datafolder
        catch
        end
        try
        % 7
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc7.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC7 = Header; clear Header;
                save(strcat(datafolder,'\CSC7.mat'));
                clearvars -except datafolder
        catch
        end
        % 8
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc8.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC8.mat'));
                clearvars -except datafolder
        catch
        end
        %9
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc9.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC9.mat'));
                clearvars -except datafolder
        catch
        end
        %10
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc10.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC10.mat'));
                clearvars -except datafolder
        catch
        end
        %11
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc11.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC11.mat'));
                clearvars -except datafolder
        catch
        end
        %12
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc12.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC12.mat'));
                clearvars -except datafolder
        catch
        end
        %13
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc13.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC13.mat'));
                clearvars -except datafolder
        catch
        end
        %14
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc14.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC14.mat'));
                clearvars -except datafolder
        catch
        end
        %15
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc15.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC15.mat'));
                clearvars -except datafolder
        end
        %16
        try
        [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples,Samples, Header] = Nlx2MatCSC(strcat(datafolder,'\csc16.ncs'), [1 1 1 1 1], 1, 1, []);
            Header_CSC8 = Header; clear Header;
                save(strcat(datafolder,'\CSC16.mat'));
                clearvars -except datafolder
        catch
        end

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
        finish = TimeStamps(1,length(TimeStamps_EV)); % may need to change to (1,4) or (1,6)
        
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

        %Populate column 4 of the Int variable 
        % 0 = Correct, 1 = Incorrect
        numtrials = size(Int,1);
        choice_trials = [2:2:numtrials];
        for j = 1:size(choice_trials,2);
                if  Int(choice_trials(j),3)== Int(choice_trials(j)-1,3);
                    Int(choice_trials(j),4)= 1;
                    Int(choice_trials(j)-1,4) = 1;
                end
        end

        percentCorrect = ((numtrials/2) - (sum(Int(:,4))/2))/(numtrials/2);

        save(strcat(datafolder,'\Int_new.mat'),'Int');
        

%% Adjust Matrices and Timestamps to 1xN Vectors
cd 'X:\03. Lab Procedures and Protocols\MATLABToolbox\chronux\spectral_analysis\continuous';

% % params are values that are necessary as input for chronus analyse
params.fpass = [0 500]; % essentially a bandpass filter that restricts to range within the signal
params.Fs = 2000; % sampling rate; or 2034 if right room
params.trialave = 0; % or 1
params.tapers = [3 5]; % taper of 5...but look into this more
params.pad = 0; % adds padding of zeros on either side of the selected chunk of signal
params.serr = [2 .05]; % sampling error bars, where 2 is jackknife

        load (strcat(datafolder,'\CSC1.mat'));
        CSC(1).whole = Samples(:)';

        load (strcat(datafolder,'\CSC2.mat'));
        CSC(2).whole = Samples(:)';

        load (strcat(datafolder,'\CSC3.mat'));
        CSC(3).whole = Samples(:)';

        load (strcat(datafolder,'\CSC4.mat'));
        CSC(4).whole = Samples(:)';

        load (strcat(datafolder,'\CSC5.mat'));
        CSC(5).whole = Samples(:)';

        load (strcat(datafolder,'\CSC6.mat'));
        CSC(6).whole = Samples(:)';
        
        load (strcat(datafolder,'\CSC7.mat'));
        CSC(7).whole = Samples(:)';

        load (strcat(datafolder,'\CSC8.mat'));
        CSC(8).whole = Samples(:)';
        
%         uncomment below for a 16-TT board %
        load (strcat(datafolder,'\CSC9.mat'));
        CSC(9).whole = Samples(:)';

        load (strcat(datafolder,'\CSC10.mat'));
        CSC(10).whole = Samples(:)';

        load (strcat(datafolder,'\CSC11.mat'));
        CSC(11).whole = Samples(:)';

        load (strcat(datafolder,'\CSC12.mat'));
        CSC(12).whole = Samples(:)';

        load (strcat(datafolder,'\CSC13.mat'));
        CSC(13).whole = Samples(:)';

        load (strcat(datafolder,'\CSC14.mat'));
        CSC(14).whole = Samples(:)';
        
        load (strcat(datafolder,'\CSC15.mat'));
        CSC(15).whole = Samples(:)';

        load (strcat(datafolder,'\CSC16.mat'));
        CSC(16).whole = Samples(:)';


for i=1:16; %adjust to match numbers of CSCs
    CSC(i).whole = cleaningscript(CSC(i).whole, params);
end

for i=1:16; % adjust to match number of CSCs
    CSCTimes(i).whole = linspace(Timestamps(1,1),Timestamps(1,end),length(CSC(i).whole));
end

%% Save
cd 'X:\08. Lab personnel\Current\David\Projects\Ephys\HC Modulation - Re_Vs_dcMEC LFP\2. Output\Ephys\Johannes\1';
save ('Day2_Processed.mat','-v7.3');