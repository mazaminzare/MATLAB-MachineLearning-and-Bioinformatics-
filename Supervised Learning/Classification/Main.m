clc;
close all;
clear all;

%% Data Loading

load fisheriris
X = meas;    % Predictors
[Group,~,Y]= unique(species); % Response

%% Model Initialization
% Decision Tree Initialization

decision_tree.name = 'decision tree';
decision_tree.maxNumSplit = 7;

% KNN Intialization
knn.name = 'knn';
knn.distance_metric = 'euclidean';
knn.num_neighbors = 3;

%% Devide dataset into train and test data

train_percentage = 70; % in percent
data = DataSplit(train_percentage,X,Y); % Splitting Data

%% Train and Test
 
model = Models(data.train_data,data.train_target,knn); % Define and Train Model
[decision_tree_result,decision_tree_output] = ModelResults(model,data.train_data,data.test_data,data.train_target,data.test_target); % Test Model

