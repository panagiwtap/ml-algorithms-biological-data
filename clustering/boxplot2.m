%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Silhouette
km_sil = [0.7999, 0.7999, 0.7999, 0.7999, 0.7999, 0.7999, 0.7999, 0.7999, 0.7999, 0.7999];
hcl_sil = [0.8106, 0.8106, 0.8106, 0.8106, 0.8106, 0.8106, 0.8106, 0.8106, 0.8106, 0.8106];

% Davies Buldin index values
km_db = [0.5702, 0.5702, 0.5702, 0.5702, 0.5702, 0.5702, 0.5702, 0.5702, 0.5702,0.5702];
hcl_db = [0.5379, 0.5379, 0.5379, 0.5379, 0.5379, 0.5379, 0.5379, 0.5379, 0.5379,0.5379];

alg = ["KM";"KM";"KM";"KM";"KM";"KM";"KM";"KM";"KM";"KM";"AHT";"AHT";"AHT";"AHT";"AHT";"AHT";"AHT";"AHT";"AHT";"AHT"];
db = [km_db; hcl_db];
sil = [km_sil; hcl_sil];

% b1 = boxplot(db,alg);
% title('Davies-Buldin index per Clustering Algorithm x 10')
% xlabel('Algorithm')
% ylabel('Davies-Buldin')
 
b2 = boxplot(sil,alg);
title('Silhouette per Clustering Algorithm x 10')
xlabel('Algorithm')
ylabel('Silhouette')