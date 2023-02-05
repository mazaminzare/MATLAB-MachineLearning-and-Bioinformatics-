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
data = DataSplit(train_percentage,X,Y);

%% K Fold Processing
kfold_num = 2;
kfold_model_train_results=table();
kfold_model_validation_results = table();
kfold_model_outputs = [];
decision_tree_max_num_split=7;
% Devide train data into train and validation data
indices = crossvalind('Kfold',data.train_target,kfold_num);
for fold=1:kfold_num
    % Get data of each fold
    datafold = DataKfolding(indices,fold,data.train_data,data.train_target);
    model = Models(datafold.train_data,datafold.train_target,decision_tree);
    [model_result,model_output] = ModelResults(model,datafold.train_data,datafold.validation_data,datafold.train_target,datafold.validation_target);

    kfold_model_train_results = [kfold_model_train_results;model_result.train_result];
    kfold_model_validation_results = [kfold_model_validation_results;model_result.test_result];
    kfold_model_outputs = [kfold_model_outputs;model_output]; 
    KfoldTrainedModels{fold} = model;
end

%% Get the best model and predict output on test dataset
[max_value,max_index] = max(kfold_model_validation_results.F1_score);
best_model = KfoldTrainedModels{max_index};
[model_test_result,model_test_output] = ModelResults(best_model,data.train_data,data.test_data,data.train_target,data.test_target);

