clc;
close all;
clear all;
%%
% Gene Data Loading
load Data.mat; % Gene Value
load Gene;   % Gene Name
NumberOfClusters=5;
%%
% Discretize Gene Data

Cycle(Cycle>0.9)=1;
Cycle(Cycle<-0.9)=-1;
Cycle(Cycle>=-0.9&Cycle<=0.9)=0;
plusone=length(find(Cycle==1));
minusone=length(Cycle==-1);
X=Cycle;
% for i=1:length(Genes)
% [r,b(i,:)]=ismember(cellstr(Genes(i)),Genes);
% end
% unique(b)

%%
% K-mean Clustering with diffrent intiuation 
center=rand(NumberOfClusters,18); %random center
% ind2=randperm(748,5);
% center2=X(ind2,:);

[Clusters(:,1),ic] = kmeans(X,NumberOfClusters,'start',center,'Distance','sqeuclidean'); %cityblock
[Clusters(:,2),ic] = kmeans(X,NumberOfClusters,'start','plus','Distance','sqeuclidean');
[Clusters(:,3),ic] = kmeans(X,NumberOfClusters,'start','sample','Distance','sqeuclidean');
[Clusters(:,4),ic] = kmeans(X,NumberOfClusters,'start','uniform','Distance','sqeuclidean');
[Clusters(:,5),ic] = kmeans(X,NumberOfClusters,'start','cluster','Distance','sqeuclidean');

for j=1:length(Genes)
    for rd=1:NumberOfClusters
        df=Clusters(j,:)';
    s=find(Clusters(j,:)==rd);
    cluster_mean(1,rd)=length(s);

    end
    [get1,get2]=max(cluster_mean);
    all_cluster(j,1)=get2;
end
Clusters = all_cluster;
kmeans_evaluation_creteria=EvaluateFunc(X,Clusters,NumberOfClusters); % evaluate which clustering parameters are suitable

%%
% GMM Gene Data Clustering
NumberOfClusters=5;
gmfit = fitgmdist(X,NumberOfClusters,'CovarianceType','full','SharedCovariance',true,'Regularize',.00001);
Clusters = cluster(gmfit,X);
gmm_evaluation = evalclusters(X,Clusters,'CalinskiHarabasz'); 
%%
% Single,Average,Complete hirerical linkage

Z = linkage(X,'complete','euclidean');
[Clusters] = cluster(Z,'maxclust',NumberOfClusters);
eva = evalclusters(X,Clusters,'CalinskiHarabasz'); 
output = WithinSumOfSqure(NumberOfClusters,Clusters,X);
[T, W, B, Sintra, Sinter] = valid_sumsqures(X,Clusters,NumberOfClusters);
%%









