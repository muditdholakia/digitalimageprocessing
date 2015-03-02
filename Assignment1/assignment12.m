x = [1:1:10];
y = x;
figure
subplot(2,2,1)
x = -pi:pi/20:pi;
plot(x,cos(x),'-ro',x,sin(x),'-.b')
hleg1 = legend('cos_x','sin_x');

subplot(2,2,2)
x = -pi:pi/20:pi;
plot(x,cos(x),'-ro',x,sin(x),'-.b')
hleg1 = legend('cos_x','sin_x');
subplot(2,2,3)
x = -pi:pi/20:pi;
plot(x,cos(x),'-ro',x,sin(x),'-.b')
hleg1 = legend('cos_x','sin_x');

subplot(2,2,4)
x = -pi:pi/20:pi;
plot(x,cos(x),'-ro',x,sin(x),'-.b')
hleg1 = legend('cos_x','sin_x');
