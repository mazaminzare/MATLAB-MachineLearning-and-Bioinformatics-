function Result = ExternalClusterAnalyzing(cluster_label, target)

Result.dice_similarity = dice(target,cluster_label);

Result.jaccard_similarity = jaccard(target,cluster_label);

end