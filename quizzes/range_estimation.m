% TODO : Find the Bsweep of chirp for 1 m resolution
speed_of_light = 3*10^8;
max_radar_range = 300;
range_resolution = 1;

b_sweep = speed_of_light / 2 * range_resolution;

% TODO : Calculate the chirp time based on the Radar's Max Range

chirp = 5.5 * (2 * max_radar_range / speed_of_light);

% TODO : define the frequency shifts 

beat_frequency = [0, 1.1e6, 13e6, 24e6];
calculated_range = speed_of_light * chirp * beat_frequency / (2 * b_sweep);
% Display the calculated range
disp(calculated_range);