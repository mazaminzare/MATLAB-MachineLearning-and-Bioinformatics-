function [ModelResult,ModelOutPut]= ModelResults(model,train_data,test_data,train_target,test_target)

[ModelOutPut.train_output,ModelResult.train_result]=ModelPredictOutput(model,train_data,train_target);
[ModelOutPut.test_output,ModelResult.test_result]=ModelPredictOutput(model,test_data,test_target);

end