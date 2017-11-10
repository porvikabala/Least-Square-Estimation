%%Least Square Estimation
%% Generation of data to be transmitted

X = floor(rand(2,1000)*2)*2-1 + i*(floor(rand(2,1000)*2)*2-1);
figure(1);
subplot(2,1,1);
plot(real(X(1,:)),imag(X(1,:)),'*r');
title('Transmitted Data: Sample 1');
xlabel('Real Part');
ylabel('Imaginary Part');
axis([-4,4,-2,2]);
subplot(2,1,2);
plot(real(X(2,:)),imag(X(2,:)),'*r');
title('Transmitted Data: Sample 2');
xlabel('Real Part');
ylabel('Imaginary Part');
axis([-4,4,-2,2]);
%% Generation of Channel Matrix and Noise; Calculation of Received and Estimated Data

H = randn(3,2) + i*randn(3,2);
m = 1;
for k = [1 0.8 0.1 0.01]
    N = k*randn(3,1000) + i*k*randn(3,1000);
    Y = H*X + N;
    figure(2);
    subplot(2,2,m);
    plot(real(Y(1,:)),imag(Y(1,:)),'*r');
    title('Received Data: Sample 1');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    axis([-10,10,-10,10]);
    figure(3);
    subplot(2,2,m);
    plot(real(Y(2,:)),imag(Y(2,:)),'*r');
    title('Received Data: Sample 2');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    axis([-10,10,-10,10]);
    figure(8);
    subplot(2,2,m);
    plot(real(Y(3,:)),imag(Y(3,:)),'*r');
    title('Received Data: Sample 3');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    axis([-10,10,-10,10]);
    x = (pinv(H'*H)*H')*Y;
    figure(4);
    subplot(2,2,m);
    plot(real(x(1,:)),imag(x(1,:)),'*r');
    title('Estimated Data: Sample 1');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    axis([-4,4,-4,4]);
    figure(5);
    subplot(2,2,m);
    plot(real(x(2,:)),imag(x(2,:)),'*r');
    title('Estimated Data: Sample 2');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    axis([-4,4,-4,4]);
    m = m+1;
    e = 1/1000*abs(sum(sum((X-x).^2)));
end
%% Calculation of Squared Error with variation in the Channel Noise

m = 1;
l = 0.1:0.01:1;
for k = 0.1:0.01:1;
H = randn(3,2) + i*randn(3,2);
N = k*randn(3,1000) + i*k*randn(3,1000);
Y = H*X + N;
x = (pinv(H'*H)*H')*Y;
en(m) = 1/1000*abs(sum(sum((X-x).^2)));
m = m+1;
end
figure(6);
plot(l,en);
title('Error in estimation with respect to Noise');
xlabel('Noise');
ylabel('Squared Error');

