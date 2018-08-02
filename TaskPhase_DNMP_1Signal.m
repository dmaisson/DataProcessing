%% Link signal with task-phase bins (time bins)
% USE FOR SINGLE SIGNAL

%Set manually
eeg=CSC(10).whole; 
Times=CSCTimes(10).whole;

Int_Sample = Int(1:2:end-1,:); % asking for the timestamps of every odd traversal for all "important" time landmarks (i.e. sample-run landmarks
Int_Choice = Int(2:2:end,:); % asking for the timestamps of every even traversal for all "important" time landmarks (i.e. choice-run landmarks

for j = 1:size(Int_Sample,1); % for every iteration 'j', where the iteration is the number of rows in the stipulated variable, with only 1 column
   SLFP(j).stem = eeg(Times > Int_Sample(j,1) & Times < Int_Sample (j,5)); %Stem; create a variable wherein, the corresponding chunk of CSC1 is taken for all cases in which the timestamp is greater than the leaving of the start box (column 1) and less than the leave of the stem(column 5)
   SLFP(j).choice = eeg(Times > Int_Sample(j,5) & Times < Int_Sample (j,6)); %Choice point
   SLFP(j).reward = eeg(Times > Int_Sample(j,2) & Times < Int_Sample (j,7)); %Reward zone
   SLFP(j).trav = eeg(Times > Int_Sample(j,1) & Times < Int_Sample (j,8)); %whole traversal
   STime(j).choice=(Times(Times > Int_Sample(j,5) & Times < Int_Sample (j,6)));
   STime(j).stem=(Times(Times > Int_Sample(j,1) & Times < Int_Sample (j,5))); 
   STime(j).trav=(Times(Times > Int_Sample(j,1) & Times < Int_Sample (j,8)));
   STime(j).reward=(Times(Times > Int_Sample(j,2) & Times < Int_Sample (j,7)));
end



for j = 1:size(Int_Choice,1); % for every iteration 'j', where the iteration is the number of rows in the stipulated variable, with only 1 column
   CLFP(j).stem = eeg(Times > Int_Choice(j,1) & Times < Int_Choice (j,5)); %Stem; create a variable wherein, the corresponding chunk of CSC1 is taken for all cases in which the timestamp is greater than the leaving of the start box (column 1) and less than the leave of the stem(column 5)
   CLFP(j).choice = eeg(Times > Int_Choice(j,5) & Times < Int_Choice (j,6)); %Choice point
   CLFP(j).reward = eeg(Times > Int_Choice(j,2) & Times < Int_Choice (j,7)); %Reward zone
   CLFP(j).trav = eeg(Times > Int_Choice(j,1) & Times < Int_Choice (j,8)); %whole traversal
   CTime(j).choice=(Times(Times > Int_Choice(j,5) & Times < Int_Choice (j,6)));
   CTime(j).stem=(Times(Times > Int_Choice(j,1) & Times < Int_Choice (j,5))); 
   CTime(j).trav=(Times(Times > Int_Choice(j,1) & Times < Int_Choice (j,8)));
   CTime(j).reward=(Times(Times > Int_Choice(j,2) & Times < Int_Choice (j,7)));
end


sn=20*params.Fs;%adjust to meet shortest Delay/srate

for j = 1:size(Int_Sample,1);
        DLFP(j).delay = eeg(Times > Int_Sample (j,8) & Times < (Int_Choice(j,1)));
        DLFP(j).delay=DLFP(j).delay%(1:sn);
        DTime(j).times = Times(Times > Int_Sample (j,8) & Times < (Int_Choice(j,1)));
        DTime(j).times=DTime(j).times%(1:sn);
%         CSCDelay(i).ITI = CSC(i).whole(Timestamps > Int_Choice (j,8) & Timestamps < Int_Sample(j,1));
%         DITI{i,j}=CSCDelay(i).ITI;
%         DITITimes{i,j}=Timestamps(Timestamps > Int_Choice (j,8) & Timestamps < Int_Sample(j,1));
end

%% Save Variables
% clearvars -except DITITimes DDelayTimes CTravTimes CRewardTimes CCPTimes CStemTimes STravTimes SRewardTimes SCPTimes SStemTimes CCP CReward CSC CSCChoice CSCDelay CSCSample CSCTimes CCP CReward CStem CTravs datafolder DDelay DITI Int Int_Choice Int_ind Int_Sample params pos_t pos_x pos_y SCP SReward SStem STravs Timestamps;
cd 'X:\08. Lab personnel\Current\David\Projects\Ephys\HC Modulation - Re_Vs_dcMEC LFP\2. Output\Ephys\Wasnt\7';
%cd C:\Users\uggriffin.PSYCH\Desktop b ;
save ('HC10_TaskPhases7.mat','-v7.3');