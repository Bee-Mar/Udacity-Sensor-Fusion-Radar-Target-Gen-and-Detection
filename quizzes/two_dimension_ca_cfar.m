% Determine the number of Training cells for each dimension Tr and Td. Similarly, pick the number of guard cells Gr and Gd.
% Slide the Cell Under Test (CUT) across the complete cell matrix
% Select the grid that includes the training, guard and test cells. Grid Size = (2Tr+2Gr+1)(2Td+2Gd+1).
% The total number of cells in the guard region and cell under test. (2Gr+1)(2Gd+1).
% This gives the Training Cells : (2Tr+2Gr+1)(2Td+2Gd+1) - (2Gr+1)(2Gd+1)
% Measure and average the noise across all the training cells. This gives the threshold
% Add the offset (if in signal strength in dB) to the threshold to keep the false alarm to the minimum.
% Determine the signal level at the Cell Under Test.
% If the CUT signal level is greater than the Threshold, assign a value of 1, else equate it to zero.
% Since the cell under test are not located at the edges, due to the training cells occupying the edges, we suppress the edges to zero. Any cell value that is neither 1 nor a 0, assign it a zero.
