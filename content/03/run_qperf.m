% example of QPerf perfusion flow mapping
pkg load image
clear all
close all

% suppose the QPerf repo was cloned to QPerf directory
% git clone ...

% load the stored data

%cd .\QPerf\examples

load perf_data_stress

command = ['C:/Users/Dimitar/Downloads/QPerf/QPerf/gadgetron_QPerf_mapping -f ./aif_stress -i ./data_stress -m ./MBF_stress --foot ' num2str(foot) ' --dt 500'];
dos(command);

% load and visualize map
fmap = analyze75read('C:/Users/Dimitar/Downloads/octave/MBF_stress.hdr');

figure; 
plot(aif);
title('AIF');

figure; imshow(fmap, 'DisplayRange', [0 6]);PerfColorMap;
