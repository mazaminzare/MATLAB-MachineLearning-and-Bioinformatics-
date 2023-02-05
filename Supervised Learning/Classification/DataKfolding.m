function  KFoldData = DataKfolding(CrossValIndices,fold,data,target)
    testIndex = CrossValIndices==fold;
    KFoldData.validation_data = data(testIndex,:);
    KFoldData.validation_target = target(testIndex);
    KFoldData.train_data =  data(~testIndex,:);
    KFoldData.train_target = target(~testIndex);
end