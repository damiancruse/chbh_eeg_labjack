%% Example code to send markers to the ActiView EEG recording
% requires in path: lab_close_sa.m  lab_init_sa.m  lab_put_code_sa.m 
% Damian Cruse 2021

%% set up the LabJack
L = lab_init_sa;
params.ext.L = L;

%% send a marker
trig_code = 1; % the code you want for your marker in your EEG recording
lab_put_code_sa(params.ext.L,trig_code); % send the trigger - within lab_put_code_sa, the pins are reset to zero after a wait of 0.002 s. 

%% at slow sampling rates, triggers can be lost; to circumvent this issue, manual resetting has been used in the past. 
WaitSecs(.05); % requires Psychtoolbox in the path
lab_put_code_sa(params.ext.L,0); % reset to zero so that the marker is discrete

%% close the LabJack
params = lab_close_sa(params);
