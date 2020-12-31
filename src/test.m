clear;
close;
clc;

% sample length: ms
time = 10;
threshold = 5000;

fid = fopen("../data/UEQ_rawFile_16bit_Task1.dat", "r");
[data, ~] = fread(fid, 51150 * time, 'int16'); % read time(ms) data
data = sum(reshape(data, 51150, []), 2) / time; % average by cycle
freq_data = fft(data);

load('../data/B3I_Codes.mat');
code = repelem(B3I_Codes(1, :), 1, 5); % use code 1 for test
freq_code = fft(code);

corr = ifft(freq_data.' .* conj(freq_code)); % calculate correlation in freq domain
corr_time = xcorr(data, code); % calculate correlation in time domain
plot(corr);
% plot(corr_time);

% plot all codes' correlation
% [X, Y] = meshgrid(1:63, 1:51150);
% plot3(X, Y, corr');
[ma, ind] = max(corr .* (corr > threshold), [], 2); % find all max value
ma = find(ma); % drop zero value
ind = round(ind(ma) / 5); % get index
display([ma, ind])