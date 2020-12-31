clear;
close;
clc;

% sample length: ms
time = 10;
threshold = 5000;

fid = fopen("../data/UEQ_rawFile_16bit_Task2.dat", "r");
[data, ~] = fread(fid, 51150 * time, 'int16');
data = sum(reshape(data, 51150, []), 2) / time;
freq_data = fft(data);

load('../data/B3I_Codes.mat');
code = repelem(B3I_Codes, 1, 5);
freq_code = fft(code, [], 2);

corr = ifft(freq_data.' .* conj(freq_code), [], 2);

% [X, Y] = meshgrid(1:63, 1:51150);
% plot3(X, Y, corr');
[ma, ind] = max(corr .* (corr > threshold), [], 2);
ma = find(ma);
ind = round(ind(ma) / 5);
display([ma, ind])