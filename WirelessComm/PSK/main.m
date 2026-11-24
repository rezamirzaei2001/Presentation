clc
clear all
close all

k = 2; 
m = 2^k; 
bitLen = 100000;   

SNR = 10;  % SNR in dB

% p = 0.3
% bits = rand(1, bitLen) < p;

bits = randi([0 1], 1, bitLen);

num_ones  = sum(bits == 1);
num_zeros = sum(bits == 0);

fprintf('one Length:   %d\n', num_ones);
fprintf('zero Length:  %d\n', num_zeros);

[txSignal,constellation] = Reza_PSK(bits,m)

% figure('Name', 'M-PSK Constellation', 'Color', 'white');
% plot(real(constellation), imag(constellation), 'ro', 'MarkerSize', 12, 'LineWidth', 2);
% hold on;
% plot(real(txSignal), imag(txSignal), 'b.', 'MarkerSize', 4);
% grid on;
% axis equal;
% xlabel('Real (I)');
% ylabel('Imag (Q)');
% title(sprintf('M-PSK Constellation — M=%d', m));
% legend('Reference', 'Transmitted', 'Location', 'best');

ebn0_dB = SNR - 10*log10(k);

sigma = sqrt(1 / (2 * 10^(ebn0_dB/10)));

noise = sigma * (randn(1, length(txSignal)) + 1j * randn(1, length(txSignal)));

rxSignal = txSignal + noise;

figure('Name', 'M-PSK Constellation', 'Color', 'white');
plot(real(constellation), imag(constellation), 'ro', 'MarkerSize', 12, 'LineWidth', 2);
hold on;
plot(real(rxSignal), imag(rxSignal), 'b.', 'MarkerSize', 4);
grid on;
axis equal;
xlabel('Real (I)');
ylabel('Imag (Q)');
title(sprintf('M-PSK Constellation — M=%d', m));
legend('Reference', 'Transmitted', 'Location', 'best');
