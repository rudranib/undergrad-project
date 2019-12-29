x=load('f11.mat');
y=load('f22.mat');
%save('f3.mat','x');
z=vertcat(x.frame_features, y.frame_features);
save('f33.mat','z');

%{
num1 = csvread('feature_1.csv');
num1 = csvread('f1.csv');
num2 = csvread('feature_2.csv');
num2 = csvread('f2.csv');
d1=num1(:,1:255);
d2=num2(:,1:255);
C=cat(1,num1,num2);
C1=vertcat(d1,d2);
csvwrite('feature_3.csv',C);
csvwrite('f3.csv',C1);

num1 = xlsread('file1.xlx');
num1 = xlsread('file2.xlx');
C=cat(1,num1,num2);
xlxwrite('file3.xlx',C);
%}
