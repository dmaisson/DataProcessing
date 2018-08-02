%% Link signal with task-phase bins (time bins)

Int_Sample = Int(1:2:end-1,:); % asking for the timestamps of every odd traversal for all "important" time landmarks (i.e. sample-run landmarks
Int_Choice = Int(2:2:end,:); % asking for the timestamps of every even traversal for all "important" time landmarks (i.e. choice-run landmarks

for i = 1:16;
   for j = 1:size(Int_Sample,1); % for every iteration 'j', where the iteration is the number of rows in the stipulated variable, with only 1 column
   CSCSample(i).stem = CSC(i).whole(CSCTimes(i).whole > Int_Sample(j,1) & CSCTimes(i).whole < Int_Sample (j,5)); %Stem; create a variable wherein, the corresponding chunk of CSC1 is taken for all cases in which the timestamp is greater than the leaving of the start box (column 1) and less than the leave of the stem(column 5)
   SStem{i,j}=CSCSample(i).stem;
   SStemTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Sample(j,1) & CSCTimes(i).whole < Int_Sample (j,5))); 
   CSCSample(i).choice = CSC(i).whole(CSCTimes(i).whole > Int_Sample(j,5) & CSCTimes(i).whole < Int_Sample (j,6)); %Choice point
   SCP{i,j}=CSCSample(i).choice;
   SCPTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Sample(j,5) & CSCTimes(i).whole < Int_Sample (j,6)));
   CSCSample(i).reward = CSC(i).whole(CSCTimes(i).whole > Int_Sample(j,2) & CSCTimes(i).whole < Int_Sample (j,7)); %Reward zone
   SReward{i,j}=CSCSample(i).reward;
   SRewardTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Sample(j,2) & CSCTimes(i).whole < Int_Sample (j,7)));
   CSCSample(i).trav = CSC(i).whole(CSCTimes(i).whole > Int_Sample(j,1) & CSCTimes(i).whole < Int_Sample (j,8)); %whole traversal
   STravs{i,j}=CSCSample(i).trav;
   STravTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Sample(j,1) & CSCTimes(i).whole < Int_Sample (j,8)));
   end
end

for i = 1:16;
   for j = 1:size(Int_Choice,1); % for every iteration 'j', where the iteration is the number of rows in the stipulated variable, with only 1 column
   CSCChoice(i).stem = CSC(i).whole(CSCTimes(i).whole > Int_Choice(j,1) & CSCTimes(i).whole < Int_Choice (j,5)); %Stem; create a variable wherein, the corresponding chunk of CSC1 is taken for all cases in which the timestamp is greater than the leaving of the start box (column 1) and less than the leave of the stem(column 5)
   CStem{i,j}=CSCChoice(i).stem;
   CStemTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Choice(j,1) & CSCTimes(i).whole < Int_Choice (j,5)));
   CSCChoice(i).choice = CSC(i).whole(CSCTimes(i).whole > Int_Choice(j,5) & CSCTimes(i).whole < Int_Choice (j,6)); %Choice point
   CCP{i,j}=CSCChoice(i).choice;
   CCPTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Choice(j,5) & CSCTimes(i).whole < Int_Choice (j,6)));
   CSCChoice(i).reward = CSC(i).whole(CSCTimes(i).whole > Int_Choice(j,2) & CSCTimes(i).whole < Int_Choice (j,7)); %Reward zone
   CReward{i,j}=CSCChoice(i).reward;
   CRewardTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Choice(j,2) & CSCTimes(i).whole < Int_Choice (j,7)));
   CSCChoice(i).trav = CSC(i).whole(CSCTimes(i).whole > Int_Choice(j,1) & CSCTimes(i).whole < Int_Choice (j,8)); %whole traversal
   CTravs{i,j}=CSCChoice(i).trav;
   CTravTimes{i,j}=(CSCTimes(i).whole(CSCTimes(i).whole > Int_Choice(j,1) & CSCTimes(i).whole < Int_Choice (j,8))); 
   end
end

sn=20*params.Fs;%adjust to meet shortest Delay/srate
for i = 1:16;
    for j = 1:size(Int_Sample,1);
        CSCDelay(i).delay = CSC(i).whole(CSCTimes(i).whole > Int_Sample (j,8) & CSCTimes(i).whole < (Int_Choice(j,1)));
        DDelay{i,j}=CSCDelay(i).delay(1:sn);
        CSCDelay(i).times = CSCTimes(i).whole(CSCTimes(i).whole > Int_Sample (j,8) & CSCTimes(i).whole < (Int_Choice(j,1)));
        DDelayTimes{i,j}=CSCDelay(i).times(1:sn);
%         CSCDelay(i).ITI = CSC(i).whole(Timestamps > Int_Choice (j,8) & Timestamps < Int_Sample(j,1));
%         DITI{i,j}=CSCDelay(i).ITI;
%         DITITimes{i,j}=Timestamps(Timestamps > Int_Choice (j,8) & Timestamps < Int_Sample(j,1));
    end
end
% /1e6
%(1:sn)
%% Save Variables
% clearvars -except DITITimes DDelayTimes CTravTimes CRewardTimes CCPTimes CStemTimes STravTimes SRewardTimes SCPTimes SStemTimes CCP CReward CSC CSCChoice CSCDelay CSCSample CSCTimes CCP CReward CStem CTravs datafolder DDelay DITI Int Int_Choice Int_ind Int_Sample params pos_t pos_x pos_y SCP SReward SStem STravs Timestamps;
cd C:\Users\dmaisson\Desktop;
save ('Day2_Hermann_Processed.mat','-v7.3');