fitest=zeros(ps,1);%ÿһ���Ķ�Ӧ�ĸ��屻����ʱΪ1������Ϊ0
fiteva=zeros(ps,1);%ÿһ���Ķ�Ӧ�ĸ��屻ʵ�ʼ���ʱΪ1������Ϊ0 

    RBFglobal;

        for mj=1:m
        k=ismember(p(mj,:),pastpos,'rows');
          if k==1
            pastid=find((ismember(p(mj,:),pastpos,'rows')));
            fiteva(mj,1)=1;%�˴�������ʵ�ʼ��������Ϊ�Ǹ�ֵ�����Բ�û�����Ӽ������
            posfit(mj,1)=pastposfit(pastid(1),1);
            MNDS(mj,1)=0; 
          end
        end

   [posfit, gbestmid] = sort(posfit, 'descend');
    p=p(gbestmid,:);
    fiteva=fiteva(gbestmid,1);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������ŵ�ֵ�ѱ�ʵ�ʼ��㣬���Ҵ���ֵ��ֱ���ҵ���һ��δ��ʵ�ʼ���Ĵ���ֵΪֹ
zero_index=find(fiteva==0) ;
k=length(zero_index); %%����0�ĸ���
% firstzeroid=zero_index(1); %%��һ��0Ԫ�ص�λ��
lastzeroid=zero_index(k); %%���һ��0Ԫ�ص�λ��
            posfit(lastzeroid,1)=evafit(p(lastzeroid,:),problem);
             evacount=evacount+1;
             fiteva(lastzeroid,1)=1;
             pastpos=[pastpos;p(lastzeroid,:)];%%%������ʷ����
             pastposfit=[pastposfit;posfit(lastzeroid,1)];
              minevafitnow = min(pastposfit);
            everyEVA=[everyEVA;evacount];
            everyGBEST=[everyGBEST;minevafitnow ];

       

 [posfit, gbestmid] = sort(posfit, 'descend');%�������У���С���Ǹ����
        p=p(gbestmid,:);

        fiteva=fiteva(gbestmid,1);
        fitest=fitest(gbestmid,1);

    gbestval = minevafitnow;
    fprintf('Best fitness: %e\n',gbestval);
    Itergbest(i2,1)=gbestval;  
    itereva(i2,1)=evacount;








