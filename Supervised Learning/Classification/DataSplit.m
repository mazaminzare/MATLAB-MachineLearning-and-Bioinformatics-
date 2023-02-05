function SplitedData=DataSplit(train_percentage,data,target)
    data_length = size(data,1);
    shuffle_index=randperm(data_length);
    shuffle_data = data(shuffle_index,:);
    shuffle_target = target(shuffle_index,:);
    train_percentage = train_percentage/100;
    train_data_num = round(data_length*train_percentage);
    SplitedData.train_data = shuffle_data(1:train_data_num,:);
    SplitedData.train_target = shuffle_target(1:train_data_num,:);
    
    SplitedData.test_data  = shuffle_data(train_data_num+1:data_length,:);
    SplitedData.test_target = shuffle_target(train_data_num+1:data_length,:);
end