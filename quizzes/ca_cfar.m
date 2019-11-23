% Implement 1D CFAR using lagging cells on the given noise and target scenario.

% Close and delete all currently open figures
close all;

% Data_points
num_elements = 1000;

% Generate random noise
noise = randn(num_elements,1);

%Targets location. Assigning bin 100, 200, 300 and 700 as Targets with the amplitudes of 8, 9, 4, 11.
noise([100 ,200, 300, 700]) = [8 9 4 11];

%plot the output
plot(noise);

% TODO: Apply CFAR to detect the targets by filtering the noise.

% 1. Define the following:
% 1a. Training Cells
% 1b. Guard Cells 

guard_cells = 4;
training_cells = 12;

% Offset : Adding room above noise threshold for desired SNR 
offset = 5;

% Vector to hold threshold values 
threshold_cfar = [];

%Vector to hold final signal after thresholding
signal_cfar = [];

% 2. Slide window across the signal length
for index = 1:(num_elements -(guard_cells + training_cells))
    
    noise_level = sum(noise(index : index + training_cells - 1));
    
    threshold = (noise_level / training_cells) * offset;
    threshold_cfar = [threshold_cfar, {threshold}];
    
    cut_signal = noise(index + training_cells + guard_cells);
        
    % 2. - 5. Determine the noise threshold by measuring it within the training cells

    % 6. Measuring the signal within the CUT

    % 8. Filter the signal above the threshold
    
    if (cut_signal < threshold)
        signal = 0;
    end

    signal_cfar = [signal_cfar, {signal}];
end

% plot the filtered signal
plot(cell2mat(signal_cfar),'g--');

% plot original sig, threshold and filtered signal within the same figure.
figure,plot(noise);
hold on,plot(cell2mat(circshift(threshold_cfar,guard_cells)),'r--','LineWidth',2)
hold on, plot (cell2mat(circshift(signal_cfar,(training_cells+guard_cells))),'g--','LineWidth',4);
legend('Signal','CFAR Threshold','detection');