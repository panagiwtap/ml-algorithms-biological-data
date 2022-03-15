clc
close all
clear all

load('GSE86469.mat');
% load('GSE103334.mat');

Xtrain = data;
Ytrain = class;

Xtrain(:,all(Xtrain ==0))=[];
Xtrain = Xtrain(:,20001:end);

%Create indices for the 10-fold cross-validation.
indices = crossvalind('Kfold',Ytrain,10);

%Initialize an object to measure the performance of the classifier.
cp = classperf(Ytrain);

% Perform the classification using the measurement data and report the error rate, 
% which is the ratio of the number of incorrectly classified samples divided by the
% total number of classified samples.
acc = [];
spec = [];
f1 = [];
for i = 1:10
    test = (indices == i); 
    train = ~test;
    mdl = fitcdiscr(Xtrain(train,:),Ytrain(train,:),'discrimType','diagLinear');
    class = predict(mdl,Xtrain(test,:));
    classperf(cp,class,test);
    acc = [acc; (1-cp.ErrorRate)];
    spec = [spec; (cp.Specificity)];
    f1 = [f1; (2/((1/cp.Sensitivity)+(1/cp.Specificity)))];
    fprintf('i=%d\n', i);
    fprintf('Accuracy: %f\n',1- cp.ErrorRate);
    fprintf('Sensitivity: %f\n',cp.Sensitivity);
    fprintf('Specificity: %f\n',cp.Specificity);
    fprintf('F1-score: %f\n\n',2/((1/cp.Sensitivity)+(1/cp.Specificity)));
end
fprintf('K-Fold Cross Validation (k=10) with Discriminant Analysis (linear)\n')
fprintf('Accuracy: %f\n',1- cp.ErrorRate);
fprintf('Sensitivity: %f\n',cp.Sensitivity);
fprintf('Specificity: %f\n',cp.Specificity);
fprintf('F1-score: %f\n\n',2/((1/cp.Sensitivity)+(1/cp.Specificity)));

%1-5000
%K-Fold Cross Validation (k=10) with Discriminant Analysis (linear)
%Accuracy: 0.742947
%Sensitivity: 0.708333
%Specificity: 0.986971
%F1-score: 0.725227

%5001-10000
%K-Fold Cross Validation (k=10) with Discriminant Analysis (linear)
%Accuracy: 0.778997
%Sensitivity: 0.791667
%Specificity: 0.985342
%F1-score: 0.785281

%10001-15000
%K-Fold Cross Validation (k=10) with Discriminant Analysis (linear)
%Accuracy: 0.797806
%Sensitivity: 0.708333
%Specificity: 0.996743
%F1-score: 0.750412

%15001-20000
%Accuracy: 0.786834
%Sensitivity: 0.791667
%Specificity: 0.995114
%F1-score: 0.789243

%20001-end
%Accuracy: 0.768025
%Sensitivity: 0.750000
%Specificity: 0.990228
%F1-score: 0.758906
%/////////////////////////////
%Average-Acc :0.7749218
%Avg-Spes:0.990879
%Avg-F1-Score :0.7618138

%GSE103334
% K-Fold Cross Validation (k=10) with Discriminant Analysis (linear)
% Accuracy: 0.333786
% Sensitivity: 0.362847
% Specificity: 0.779412
% F1-score: 0.495172