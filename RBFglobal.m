IP_train = pastpos;
OT_train = pastposfit;
INput=[ OT_train IP_train];
%  [INput,~,~] = unique(INput,'rows');
PREIN=INput;
[PRETrainL,PRETrainD]=size(PREIN); 

% sample=floor(PRETrainL/100);
%  trainnum=sample*100;
% st=trainnum/PRETrainL;
st=0.8;
STId=rand(PRETrainL,1);%STId is the id of slected train data
I1=find(STId<=st);
I0=find(STId>st);

P_train =PREIN(I1,(2:D+1));
T_train =PREIN(I1,1);
if  isempty(I0)
T_testin = P_train ;
T_testout =T_train;
else
T_testin = PREIN(I0,(2:D+1));
T_testout = PREIN(I0,1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [lambda, gamma]=RBF(P_train,T_train,'cubic'); 
% posfitRBF=RBF_eval(T_test,P_train,lambda,gamma,'cubic');

% spreadA= max( P_train) ;
% spreadB= min( P_train) ;
% spread=norm(spreadA-spreadB);
% [LRMdl] =newrb(P_train',T_train',0.1,spread,8,1);
% 
% t_sim=sim(LRMdl,p');
% posfit=t_sim';
% pastfsim=sim(LRMdl,T_testin');
% mse=mean(abs(T_testout-pastfsim'));

[lambda, gamma]=RBF(P_train,T_train,'cubic'); 
posfit=RBF_eval(p,P_train,lambda,gamma,'cubic');
% pastfsim=RBF_eval(T_testin,P_train,lambda,gamma,'cubic');
% mse=mean(abs(T_testout-pastfsim));
% 
% 
% 
%     [ MNDS ] = DS(p,P_train );


