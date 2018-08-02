function  [Int]=whereishe_andrew(pos_x,pos_y,pos_t);

n=length(pos_x);


%% copy/paste new field dimensions/values from 'view_VT_data.m' in this section:
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
% DONT FORGET TO CLICK SAVE AFTER!



%% dont' change:

A_start_x = rRW_fld(1,1); A_end_x =(rRW_fld(1,1)+rRW_fld(1,3));A_start_y =rRW_fld(1,2); A_end_y =(rRW_fld(1,2)+rRW_fld(1,4)); 
B_start_x = lRW_fld(1,1); B_end_x =(lRW_fld(1,1)+lRW_fld(1,3));B_start_y =lRW_fld(1,2); B_end_y =(lRW_fld(1,2)+lRW_fld(1,4)); 
C_start_x = STM_fld(1,1); C_end_x =(STM_fld(1,1)+STM_fld(1,3));C_start_y =STM_fld(1,2); C_end_y =(STM_fld(1,2)+STM_fld(1,4)); 
D_start_x = PED_fld(1,1); D_end_x =(PED_fld(1,1)+PED_fld(1,3));D_start_y =PED_fld(1,2); D_end_y =(PED_fld(1,2)+PED_fld(1,4)); 
E_start_x = CP_fld(1,1); E_end_x =(CP_fld(1,1)+CP_fld(1,3));E_start_y =CP_fld(1,2); E_end_y =(CP_fld(1,2)+CP_fld(1,4)); 



% (rest of) regular 'whereishe' continues here

A_mid_x = (A_start_x + A_end_x)/2;
B_mid_x = (B_start_x + B_end_x)/2;

num_Int = 1;
Int = [];
E2 = [];

%Tstamp variables
interval_start_tstamp = 0;interval_end_tstamp = 0;
E_start_t = 0; E_end_t = 0;

%State variables. Indicator (1 or 0)
inside_A = 0;inside_B = 0; inside_C = 0; inside_D = 0; has_been_to_C = 0;
has_been_to_D = 0; num_L=0; num_R=0; has_been_to_A=0; has_been_to_B=0;
inside_E = 0; has_been_to_E = 0;

was_inside_A=0; was_inside_B=0; was_inside_D=0; 

for i=1:n
    
    %Where was the rat?
    was_inside_A=inside_A;
    was_inside_B=inside_B;
    was_inside_C=inside_C;
    was_inside_D=inside_D;
    was_inside_E=inside_E;
    
    %Where is the rat? These expressions evalue to 1 when true and 0 when
    %false. It's a shorter If statement.
    inside_A = (pos_x(1,i)>=A_start_x) && (pos_x(1,i)<=A_end_x) && (pos_y(1,i)>=A_start_y) && (pos_y(1,i)<=A_end_y);
    has_been_to_A = (((pos_x(1,i)>=A_start_x) && (pos_x(1,i)<=A_end_x) && (pos_y(1,i)>=A_start_y) && (pos_y(1,i)<=A_end_y)) || (has_been_to_A == 1));
    inside_B = (pos_x(1,i)>=B_start_x) && (pos_x(1,i)<=B_end_x) && (pos_y(1,i)>=B_start_y) && (pos_y(1,i)<=B_end_y);
    has_been_to_B = (((pos_x(1,i)>=B_start_x) && (pos_x(1,i)<=B_end_x) && (pos_y(1,i)>=B_start_y) && (pos_y(1,i)<=B_end_y)) || (has_been_to_B == 1));
    inside_C = (pos_x(1,i)>=C_start_x) && (pos_x(1,i)<=C_end_x) && (pos_y(1,i)>=C_start_y) && (pos_y(1,i)<=C_end_y);
    has_been_to_C = (((pos_x(1,i)>=C_start_x) && (pos_x(1,i)<=C_end_x) && (pos_y(1,i)>=C_start_y) && (pos_y(1,i)<=C_end_y)) || (has_been_to_C==1));
    inside_D = (pos_x(1,i)>=D_start_x) && (pos_x(1,i)<=D_end_x) && (pos_y(1,i)>=D_start_y) && (pos_y(1,i)<=D_end_y);
    has_been_to_D = (((pos_x(1,i)>=D_start_x) && (pos_x(1,i)<=D_end_x) && (pos_y(1,i)>=D_start_y) && (pos_y(1,i)<=D_end_y)) || (has_been_to_D==1));
    inside_E = (pos_x(1,i)>=E_start_x) && (pos_x(1,i)<=E_end_x) && (pos_y(1,i)>=E_start_y) && (pos_y(1,i)<=E_end_y);
    has_been_to_E = (((pos_x(1,i)>=E_start_x) && (pos_x(1,i)<=E_end_x) && (pos_y(1,i)>=E_start_y) && (pos_y(1,i)<=E_end_y)) || (has_been_to_E==1));
    
    %we are interested in the interval between the exit from D (box) and the entry to B or A (reward zones), respectively:
    if ((was_inside_D ~=0) && (inside_D==0))
%        just left D, note the time:
        interval_start_tstamp=pos_t(1,i);
    end
    
%     if (((was_inside_A==0) && (inside_A ~=0) && (has_been_to_C ~=0)) || ((was_inside_B==0) && (inside_B ~=0) && (has_been_to_C ~=0)))
%         %Just entered A or B. Note time
%         interval_end_tstamp=pos_t(1,i);
%     end

    if (was_inside_E==0) && (inside_E ~=0)
        E_start_t = pos_t(1,i);
    end

    if (was_inside_E ~=0) && (inside_E==0)
        E_end_t = pos_t(1,i);
    end
    
    %If he was coming from E, he is choosing a reward zone.
    if (was_inside_A==0) && (inside_A ~=0) && (has_been_to_E ~=0) 
        %Chose right
%         interval_end_tstamp=pos_t(1,i);
        Int(num_Int,:) = [interval_start_tstamp, pos_t(1,i), 1, 0, E_start_t, E_end_t, NaN, NaN];
        num_Int = num_Int + 1;
%         Int_R(num_R, 2)=interval_end_tstamp;

         if has_been_to_B == 1
%             Int_L(num_L,1:2) = 0;
%             num_L = num_L-1;
             has_been_to_B = 0;
         end
        
    end
    
    if (was_inside_B==0) && (inside_B ~=0) && (has_been_to_E ~=0)
        %Chose left
%         interval_end_tstamp=pos_t(1,i);
        Int(num_Int,:) = [interval_start_tstamp, pos_t(1,i), 0, 0, E_start_t, E_end_t, NaN, NaN];
        num_Int = num_Int + 1;
%         Int_L(num_L, 2)=interval_end_tstamp;

         if has_been_to_A == 1
%             Int_R(num_R,1:2) = 0;
%             num_R = num_R-1;
             has_been_to_A = 0;
         end
        
    end
    
    %When the animal leaves A or B, reset the indicator of whether he has
    %been to C and E
    %Potentially an issue if the animal backtracks
    if (was_inside_A ~=0) && (inside_A==0) || (was_inside_B ~=0) && (inside_B==0)
        has_been_to_C=0;
        has_been_to_E=0;
    end
    
    if (inside_A==0) && (was_inside_A~=0) && (pos_x(1,i) < A_start_x)
        %Left of the Right reward zone on the return stem
        E2(num_Int,1) = pos_t(1,i);
        has_been_to_D = 0;
    end
    
    if (inside_B ==0) && (was_inside_B~=0) && (pos_x(1,i) < B_start_x)
        %Left of the Left reward zone on the return stem
        E2(num_Int,1) = pos_t(1,i);
        has_been_to_D = 0;
    end
    
    if (inside_D ==1) && (was_inside_D==0) && (has_been_to_A == 1)
        %Entering the Base from the Right Reward Zone
        E2(num_Int,2) = pos_t(1,i);
        has_been_to_A = 0;
    end
    
    if (inside_D ==1) && (was_inside_D==0) && (has_been_to_B == 1)
        %Entering the Base from the Left Reward Zone
        E2(num_Int,2) = pos_t(1,i);
        has_been_to_B = 0;
    end
    
end

if ~isempty(Int)
    Int(:,[7,8]) = E2([2:num_Int],:);
end

%{
%Third Int column is L/R marker. 0=Left, 1=Right
if ~isempty(Int_L)
    Int_L(:,3)=0; %Denote Left turns with 0s in the third column
    Int_L(:,[7,8]) = Int_Lr;
end

if ~isempty(Int_R)
    Int_R(:,3)=1; %Denote Right turns with 1s in the third column
    Int_R(:,[7,8]) = Int_Rr;
end
%}
clear q p r

% Int = [Int_L;Int_R]; %Put both turn types together
% [tmp,idx] = sort(Int(:,1)); %Get an index of Int sorted by starting timestamp
% Int = Int(idx,:); %Change Int so it's sorted by timestamp.

%In the end, Int() will have:
%Column 1: Starting timestamp for a run
%Column 2: Ending timestamp for a run
%Column 3: L/R marker (0 = Left, 1 = Right) - from whereishe
%Column 4: Whether the L/R marker matches the intended (baiting) pattern* 
%Column 5: Whether the L/R marker matches the tester's notes* - correct or not
%Column 6: Combined L/R+Error data*
% 3 is a perfect left turn. 5 is an incorrect left turn.
% 6 is a correct right turn. 10 is an incorrect right turn.
%Column 7: Starting timestamp for the return trip
%Column 8: Ending timestamp for the return trip
% * = not in this function.