% %Start box
XV_sb = [50 160 160 50 50];
YV_sb = [300 300 400 400 300];

% % XV_sb = [280 280+150 280+150 280 280];
% % YV_sb = [35 35+125 35+125 35 35];
% %  
% % %Stem
% XV_stem = [135 340 340 135 135];
% YV_stem = [345 345 365 365 345];
% % XV_stem = [335 335+35 335+35 335 335];
% % YV_stem = [160 160+210 160+210 160 160];
% % 
% % %Choice point
% XV_cp = [340 400 400 340 340];
% YV_cp = [250 250 470 470 250];
% % XV_cp = [320 320+75 320+75 320 320];
% % YV_cp = [370 370+60 370+60 370 370];
% 
% % %Reward zones (Right and Left)
% XV_rew_r = [325 400 400 325 325];
% YV_rew_r = [150 150 250 250 150];
% % XV_rew_r = [485 485+65 485+65 485 485];
% % YV_rew_r = [290 290+100 290+100 290 290];
% 
% XV_rew_l = [325 400 400 325 325];
% YV_rew_l = [470 470 550 550 470];
% % XV_rew_r = [145 145+65 145+65 145 145];
% % YV_rew_r = [290 290+100 290+100 290 290];
% 
% % %Return arms (Right and Left)
% XV_ret_l = [135 135 325 325 135];
% YV_ret_l = [370 550 550 370 370];
% % XV_ret_r = [375 375+150 375+150 375 375];
% % YV_ret_r = [160 160+130 160+130 160 160];
% 
% XV_ret_r = [135 135 325 325 135];
% YV_ret_r = [150 343 343 150 150];
% % XV_ret_l = [210 210+120 210+120 210 210];
% % YV_ret_l = [160 160+165 160+165 160 160];

% Bowl as anchor
XV_bowl = [1 80 80 1 1];
YV_bowl = [500 500 600 600 500];

% Whole TMaze
XV_all = [160 450 450 160 160];
YV_all = [130 130 570 570 130];

% plot them
figure; hold on;
% plot(X_all,Y_all,'r');
plot(XV_bowl,YV_bowl,'g');
plot(XV_sb,YV_sb,'g');
% plot(XV_stem,YV_stem,'g');
% plot(XV_cp,YV_cp,'g');
% plot(XV_rew_r,YV_rew_r,'g');
% plot(XV_rew_l,YV_rew_l,'g');
% plot(XV_ret_l,YV_ret_l,'g');
% plot(XV_ret_r,YV_ret_r,'g');
plot(XV_all, YV_all,'r');