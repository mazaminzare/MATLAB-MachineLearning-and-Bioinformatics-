function valuationcreteria=EvaluateFunc(X,Clusters,NumberOfClusters)

for i=1:NumberOfClusters
    indx=find(Clusters==i);
    Ni=length(indx);
GetMean=sum(X(indx,:))./Ni;
for j=1:Ni
    sum1(j,:)=abs(X(i,:)-GetMean);
end
r(i,:)=sum(sum1);
end
valuationcreteria=r;