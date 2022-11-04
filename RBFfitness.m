fitest=zeros(ps,1);%每一代的对应的个体被估计时为1，否则为0
fiteva=zeros(ps,1);%每一代的对应的个体被实际计算时为1，否则为0 

    RBFglobal;

        for mj=1:m
        k=ismember(p(mj,:),pastpos,'rows');
          if k==1
            pastid=find((ismember(p(mj,:),pastpos,'rows')));
            fiteva(mj,1)=1;%此处仅代表实际计算过，因为是赋值，所以并没有增加计算次数
            posfit(mj,1)=pastposfit(pastid(1),1);
            MNDS(mj,1)=0; 
          end
        end

   [posfit, gbestmid] = sort(posfit, 'descend');
    p=p(gbestmid,:);
    fiteva=fiteva(gbestmid,1);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%如果最优的值已被实际计算，则找次优值，直到找到第一个未被实际计算的次优值为止
zero_index=find(fiteva==0) ;
k=length(zero_index); %%所有0的个数
% firstzeroid=zero_index(1); %%第一个0元素的位置
lastzeroid=zero_index(k); %%最后一个0元素的位置
            posfit(lastzeroid,1)=evafit(p(lastzeroid,:),problem);
             evacount=evacount+1;
             fiteva(lastzeroid,1)=1;
             pastpos=[pastpos;p(lastzeroid,:)];%%%更新历史数据
             pastposfit=[pastposfit;posfit(lastzeroid,1)];
              minevafitnow = min(pastposfit);
            everyEVA=[everyEVA;evacount];
            everyGBEST=[everyGBEST;minevafitnow ];

       

 [posfit, gbestmid] = sort(posfit, 'descend');%倒序排列，最小的那个最好
        p=p(gbestmid,:);

        fiteva=fiteva(gbestmid,1);
        fitest=fitest(gbestmid,1);

    gbestval = minevafitnow;
    fprintf('Best fitness: %e\n',gbestval);
    Itergbest(i2,1)=gbestval;  
    itereva(i2,1)=evacount;








