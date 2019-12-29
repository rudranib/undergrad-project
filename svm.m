function SVM_class = svm();
load_data=load('f3.mat');
%l=load_data(:,255);
l=load_data.z(:,471);
save('labels.mat','l');
%dataset=load_data(:,1:254);
dataset=load_data.z(:,1:470);
save('datasvm.mat','dataset');

data1 = load('datasvm.mat');
data=data1.dataset;

lables1 = load('labels.mat');
lables=lables1.l;

%data=csvread('f3.csv');
%lables=csvread('l1.csv');

rand_num = randperm(size(data,1));

x_train = data(rand_num(1:round(0.7*length(rand_num))),:);
y_train = lables(rand_num(1:round(0.7*length(rand_num))),:);

x_test = data(rand_num(round(0.7*length(rand_num))+1:end),:);
y_test = lables(rand_num(round(0.7*length(rand_num))+1:end),:);
%{
c = cvpartition(y_train,'k',5);
opts = statset('display','iter');
classf = @(train_data, train_labels, test_data, test_labels) sum(predict(fitcsvm(train_data, train_labels,'KernelFunction','rbf'), test_data) ~= test_labels);

[fs, history] = sequentialfs(classf, x_train, y_train, 'cv', c, 'options', opts,'nfeatures',2);

X_train_w_best_feature = x_train(:,fs);

Mdl = fitcsvm(X_train_w_best_feature,y_train,'Standardize',true,'KernelFunction','linear','KernelScale','auto');
%}
Mdl = fitcsvm(x_train,y_train,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');

%X_test_w_best_feature = x_test(:,fs);
predicted_labels=predict(Mdl,x_test);
accuracy=sum((predict(Mdl,x_test) == y_test))/length(y_test)*100
target=transpose(y_test);
output=transpose(predicted_labels);
confMat = plotconfusion(target,output);

%{
for i =1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(i,:)); 
end
precision(isnan(precision))=[];
Precision=sum(precision)/size(confMat,1);

for i =1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(:,i));  
end

Recall=sum(recall)/size(confMat,1);

[F1,precision,recall,accuracy] = printClassMetrics (predicted_labels , y_test)
%}
[precision,recall,accuracy] = printClassMetrics (predicted_labels , y_test)

