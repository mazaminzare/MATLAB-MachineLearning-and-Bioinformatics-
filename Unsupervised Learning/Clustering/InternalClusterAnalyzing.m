function Result = InternalClusterAnalyzing(X,cluster_label)

Result.CalinskiHarabasz = evalclusters(X,cluster_label,'CalinskiHarabasz');
Result.DaviesBouldin = evalclusters(X,cluster_label,'DaviesBouldin');
Result.Silhouette = evalclusters(X,cluster_label,'silhouette');
 
Result.SilhouetteScore = Result.Silhouette.CriterionValues;
Result.DaviesBouldinScore = Result.DaviesBouldin.CriterionValues;
Result.CalinskiHarabaszScore = Result.CalinskiHarabasz.CriterionValues;


end