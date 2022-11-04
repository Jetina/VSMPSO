function [ MNDS ] = DS( p,trainp)
lp=0.1;
%P��ǰ��Ⱥ
%pastpos ALL evaluated solutions in database
%Calculate the dissimilarity between each two solutions
for i=1:size(p,1)
    for j=1:size(trainp,1)
       d=sum(abs(trainp(j,:)-p(i,:)).^lp,2).^(1/lp);
       ds(i,j)=d;% DS is dissimilarity
    
    end
end
 [NDS,~] = mapminmax(ds,0,1); %DS��һ�� ,����ÿһά�Ϲ�һ��������ƽ��
MNDS=mean(NDS,2);%��ÿһ�еľ�ֵ 
end