%% Analog Filter Plotting

load('analog_data.asc')
pulse_train = analog_data(1:1000,1)*5/1023;
analog_filter_out = analog_data(1:1000,2)*5/1023;

figure(1)
n = 0:1:999;
plot(n,pulse_train,'b-o',n,analog_filter_out, 'r-o')
xlim([0 100])
ylim([0 5])
title('Analog Filter Input/Output Data duty cycle = 0.4')
xlabel('n')
ylabel('V')
legend('x[n]','x_A[n]')


%% Digital Filter Plotting

load('digital_data.asc')
digital_filter_out = digital_data(1:1000,2)*5/1023;

figure(2)
n = 0:1:999;
plot(n,analog_filter_out,'r-o',n,digital_filter_out,'g-o')
xlim([0 100])
title('Digital Filter Input/Output Data duty cycle = 0.4')
xlabel('n')
ylabel('V')
legend('x_A[n]','x_D[n]')

%% Hanning Windowed Filter FFT Plotting (Jasmine)

w = (1-cos(2*pi*n/999))/2;
pulse_train_h = pulse_train.*w';
analog_h = analog_filter_out.*w';
digital_h = digital_filter_out.*w';

DFTpulse = fft(pulse_train_h)/1000;
DFTpulse_mag = 2*abs(DFTpulse);
figure(3)
plot(n,DFTpulse_mag)
axis([0 500 0 1.5])
title('Pulse Train DFT (Hanning Window) N= 106 40% duty cycle')
xlabel('m = 0...499')
ylabel('2*|Xh(m)|')

DFTanalog = fft(analog_h)/1000;
DFTanalog_mag = 2*abs(DFTanalog);
figure(4)
plot(n,DFTanalog_mag)
axis([0 500 0 1.5])
title('Analog Filter DFT (Hanning Window)')
xlabel('m = 0...499')
ylabel('2*|Xh_A(m)|')

DFTdigital = fft(digital_h)/1000;
DFTdigital_mag = 2*abs(DFTdigital);
figure(5)
plot(n,DFTdigital_mag)
axis([0 500 0 1.5])
title('Digital Filter DFT (Hanning Window)')
xlabel('m = 0...499')
ylabel('2*|Xh_D(m)|')