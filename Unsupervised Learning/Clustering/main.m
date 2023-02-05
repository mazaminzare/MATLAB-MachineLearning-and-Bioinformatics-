clc;
clear all;
close all;

load fisheriris
X = meas;    % Data
[Group,~,Y]= unique(species); % Target
%% Model Initialization
% Kmeans

kmeans.Name = 'kmeans';
kmeans.ClusterNum = 3;
kmeans.DistanceMetric = 'cityblock';
kmeans.Display = 'final';
kmeans.Replicates = 5;

% Dbscan
dbscan.Name = 'dbscan';
dbscan.Epsilon = 1;
dbscan.Minpts = 20;

% Hierarchical
hierarchical.Name = 'hierarchical';
hierarchical.Distance = "euclidean";
hierarchical.Method = "average";
hierarchical.MaxCluster = 3;

% Spectral
spectral.Name = 'spectral';
spectral.ClusterNum=3;

%% Clustering

model = ClusteringModels(X,kmeans);

%% Cluster Analyzing
InternalAnalyzing = InternalClusterAnalyzing(X,model.label);
ExternalAnalyzing = ExternalClusterAnalyzing(model.label,Y);
 