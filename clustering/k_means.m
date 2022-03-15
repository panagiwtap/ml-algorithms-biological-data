clc
close all
clear all


%load('C:/Users/megac/ml-algorithms-biological-data/pez_datasets/GSE103334.mat')
load('C:/Users/megac/ml-algorithms-biological-data/pez_datasets/GSE86469.mat')

%predicted cluster indicies and centroid locations
% [idx, C] = kmeans(data, 2);

for i = 1:10
    fprintf('i=%d\n', i);
    ev_db = evalclusters(data, 'kmeans','DaviesBouldin', 'KList',[2:5]);
    ev_db.CriterionValues
    ev_sil = evalclusters(data, 'kmeans','silhouette', 'KList', [2:5]);
    ev_sil.CriterionValues
end

