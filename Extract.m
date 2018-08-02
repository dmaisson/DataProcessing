cd 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3'

load CSC1.mat;
CSC1 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC1.mat'

load CSC2.mat;
CSC2 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC2.mat'

load CSC3.mat;
CSC3 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC3.mat'

load CSC4.mat;
CSC4 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC4.mat'

load CSC5.mat;
CSC5 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC5.mat'

load CSC6.mat;
CSC6 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC6.mat'

load CSC7.mat;
CSC7 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC7.mat'

load CSC8.mat;
CSC8 = Samples(:)';
save 'X:\01.Experiments\Reuniens related_acg\Rats_all\AAA_all_rats\Lenny\Lenny_DNMP_Ses3\CSC8.mat'

Timestamps=linspace(Timestamps(1,1),Timestamps(1,end),length(CSC1));

% subplot(8,1,1); plot(Timestamps, CSC1); title('LFP1, Re');
% subplot(8,1,2); plot(Timestamps, CSC2); title('LFP2, HPC');
% subplot(8,1,3); plot(Timestamps, CSC3); title('LFP3, Re');
% subplot(8,1,4); plot(Timestamps, CSC4); title('LFP4, Re');
% subplot(8,1,5); plot(Timestamps, CSC5); title('LFP5, mPFC');
% subplot(8,1,6); plot(Timestamps, CSC6); title('LFP6, Re');
% subplot(8,1,7); plot(Timestamps, CSC7); title('LFP7, Re');
% subplot(8,1,8); plot(Timestamps, CSC8); title('LFP8, HPC');