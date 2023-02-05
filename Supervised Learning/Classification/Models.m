function model = Models(train_data,train_target,parameter)



switch parameter.name   
    case 'decision tree'
        model = fitctree(train_data,train_target,'MaxNumSplits',parameter.maxNumSplit);
    case 'knn'
        model = fitcknn(train_data,train_target,'Distance',parameter.distance_metric,...
    'NumNeighbors',parameter.num_neighbors,'Standardize',1);
    
    otherwise
         disp('You should a model to train')
         error('You did not select a model to train')

end


end