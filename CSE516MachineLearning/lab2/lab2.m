%3.1
x = [2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1]
y = [2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9]
xm = mean(x)
ym = mean(y)
x2 = x-xm
y2 = y-ym
%plot(x2, y2, '+')
%title('Original data')

%3.2
cov(x2, y2)
c = cov(x2, y2)
[EVal, EVec] = eig(c)
%EVal = (-2: 0.5: 2);
%EVec = (-2: 0.5: 2);
e1 = EVec;
e2 = EVal;
%plot(x2, y2, '+', e1, e2,'--')
%title('Normalized data with primary component')

%3.3
f = sort(e2)
x3 = x2.'
y3 = y2.'
f2 = f.'
f2 = f.'
%x4 = x3 * f2
%y4 = y3 * f2
%plot(x4, y4, '+', e1, e2,'--')
%title('Data in new space')

%3.5
fd1 = f2 * x3
fd2 = f2 * y3
rod1 = f * fd1 + xm
rod2 = f * fd2 + ym
plot(rod1, rod2, '+')
title('Data with reduced dimension')

plot(x2, y2, '+', rod1, rod2, 'o')
legend('Original data', 'Data with reduced dimension')





