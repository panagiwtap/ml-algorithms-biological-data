clear all
close all
clc

%load('C:/Users/megac/ml-algorithms-biological-data/pez_datasets/GSE103334.mat')
load('C:/Users/megac/ml-algorithms-biological-data/pez_datasets/GSE86469.mat')

% Create a hierarchical cluster tree using the ward linkage method.
% Z = linkage(data, 'ward');

for i = 1:10
    fprintf('i=%d\n', i);
    ev_db = evalclusters(data, 'linkage','DaviesBouldin', 'KList',[2:5]);
    ev_db.CriterionValues
    ev_sil = evalclusters(data, 'linkage','silhouette', 'KList', [2:5]);
    ev_sil.CriterionValues
end