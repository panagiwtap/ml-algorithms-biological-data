clc
close all
clear all

load('GSE86469.mat')
% load('GSE103334.mat');

Xtrain = data;
Ytrain = class;

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
    t = templateTree('MaxNumSplits',5);
    mdl = fitcensemble(Xtrain(train,:),Ytrain(train,:),'Method','AdaBoostM2','Learners',t);
    class = predict(mdl,Xtrain(test,:));
    classperf(cp,class,test);
    acc = [acc; (1-cp.ErrorRate)];
    spec = [spec; (cp.Specificity)];
    f1 = [f1; (2/((1/cp.Sensitivity)+(1/cp.Specificity)))];
    fprintf('i=%d\n', i);
end
fprintf('K-Fold Cross Validation (k=10) with Support Vector Machines\n')
fprintf('Accuracy: %f\n',1- cp.ErrorRate);
fprintf('Sensitivity: %f\n',cp.Sensitivity);
fprintf('Specificity: %f\n',cp.Specificity);
fprintf('F1-score: %f\n\n',2/((1/cp.Sensitivity)+(1/cp.Specificity)));

%K-Fold Cross Validation (k=10) with Support Vector Machines
%GSE86469
%Accuracy: 0.987461
%Sensitivity: 0.916667
%Specificity: 1.000000
%F1-score: 0.950748

%GSE10334
%Accuracy: 0.559783
%Sensitivity: 0.529514
%Specificity: 0.846814
%F1-score: 0.651589
