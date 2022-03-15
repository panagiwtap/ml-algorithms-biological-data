X = load('/home/mariak/pez/2/AI/project_B/pez_datasets/GSE103334.mat')

idx = dbscan(X.('data'), 1, 5, 'Distance', 'squaredeuclidean');