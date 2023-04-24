function  output = WithinSumOfSqure(NumberOfClusters,Clusters,X)

%evaluation get Within Sum Of Squre(root)

for i=1:NumberOfClusters
    indx=find(Clusters==i);
    Clust{i}=cellstr(Genes(indx));
    Ni=length(indx);
    if(Ni~=1)
GetMean=mean(X(indx,:));
    else
        GetMean=(X(indx,:));
    end
d1=X(indx,:);
be=0;
for j=1:Ni
    a=0;
    for d=1:18
        a=a+(d1(j,d)-GetMean(1,d))^2;
    end
    be=a+be;
end
fg(i)=sqrt(be);
end
output = sum(fg);

end