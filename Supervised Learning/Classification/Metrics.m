function Result = Metrics(target,output)



   confusion_matrix = confusionmat(target,output);
   [metric,~] = multiclass_metrics(confusion_matrix);
   metric.cross_entropy_loss = crossentropy(output,target);
%    metric.MSE = mse(target,output);
   metric.RMSE=rmse(output,target);
   metric = struct2table(metric);
   Result = metric;
end