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
legend('x[n]','y[n]')