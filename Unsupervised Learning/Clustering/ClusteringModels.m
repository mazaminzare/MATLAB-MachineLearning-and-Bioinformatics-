function model = ClusteringModels(unlabeled_data,parameter)


switch parameter.Name   
    case 'kmeans'
        [model.label,model.centers,model.sumdists] = kmeans(unlabeled_data,parameter.ClusterNum,'Distance', ...
            parameter.DistanceMetric, ...
    'Display',parameter.Display,'Replicates',parameter.Replicates);      
    case 'dbscan'
        model.label = dbscan(unlabeled_data,parameter.Epsilon,parameter.Minpts);
    case 'hierarchical'
        model.Z = linkage(unlabeled_data,parameter.Method,parameter.Distance);
        model.label = cluster(model.Z,"maxclust",parameter.MaxCluster);
    case 'spectral'
        model.label = spectralcluster(unlabeled_data,parameter.ClusterNum);
    otherwise
         disp('You should a model to cluster')
         error('You did not select a model to cluster')

end


end