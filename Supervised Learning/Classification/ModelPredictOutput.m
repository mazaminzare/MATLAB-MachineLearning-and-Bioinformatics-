function [output,result]=ModelPredictOutput(model,data,target)
output = model.predict(data);
result= Metrics(target,output);
end
