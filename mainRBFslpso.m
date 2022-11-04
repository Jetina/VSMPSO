clc
 clear all 
for i=22:i+5:25
   pool = startparallelpool(30);

%  mex cec13_func.cpp -DWINDOWS
% for problem = 1 : 13

% path =[cd,'\F1_F4']; %创建数据文件夹
% if ~isdir(path) 
%     mkdir(path);
% end

% D=100;%%%%%%%%%%确定维数
% PNUM=[5 10 11 14];
PNUM=[10 5
     10  10
     10  11
     10  14
     10  9
     20 5
     20  10
     20  11
     20  14
     20  9
     30 5
     30  10
     30  11
     30  14
     30  9
     50 5
     50  10
     50  11
     50  14
     50  9 
     100 5
     100  10
     100  11
     100  14
     100  9 
       ];



  D=PNUM(i,1)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%此处对照SLPSO的论文中函数序号确定函数
  problem=PNUM(i,2)
% problem=PNUM(i)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%此处对照SLPSO的论文中函数序号确定函数
 
 switch i
             case 1  
                 Filename='RBFSLPSORosenbrock10_80D'; 
             case 2    
                 Filename='RBFSLPSOAckley10_80_2000D';
             case 3   
                 Filename='RBFSLPSOGriewank10_80D';
             case 4  
                 Filename='RBFSLPSOEllipsoid10_80D';
             case 5 
                 Filename='RBFSLPSORastrigin10_80D';
             case 6    
                 Filename='RBFSLPSORosenbrock20_80D'; 
             case 7                                
                 Filename='RBFSLPSOAckley20_80_2000D';
             case 8   
                 Filename='RBFSLPSOGriewank20_80D';
             case 9  
                 Filename='RBFSLPSOEllipsoid20_80D';                   
             case 10  
                   Filename='RBFSLPSORastrigin20_80D';
             case 11  
                 Filename='RBFSLPSORosenbrock30_80D'; 
             case 12    
                 Filename='RBFSLPSOAckley30_80_2000D';
             case 13   
                 Filename='RBFSLPSOGriewank30_80D';
             case 14  
                 Filename='RBFSLPSOEllipsoid30_80D';
             case 15 
                 Filename='RBFSLPSORastrigin30_80D';
             case 16    
                 Filename='RBFSLPSORosenbrock50_80D'; 
             case 17                                
                 Filename='RBFSLPSOAckley50_80_2000D';
             case 18   
                 Filename='RBFSLPSOGriewank50_80D';
             case 19  
                 Filename='RBFSLPSOEllipsoid50_80D';                   
             case 20  
                 Filename='RBFSLPSORastrigin50_80D';
             case 21   
                 Filename='RBFSLPSORosenbrock100_80D'; 
             case 22                                
                 Filename='RBFSLPSOAckley100_80_2000D';
             case 23  
                 Filename='RBFSLPSOGriewank100_80D';
             case 24  
                 Filename='RBFSLPSOEllipsoid100_80D';                   
             case 25  
                 Filename='RBFSLPSORastrigin100_80D';
  end
% Filename='\datanonlyfit\RBFSLPSOEllipsoid100matern32pureQuadratic';

%Rosenbrock5 Ackley10 Griewank11 Ellipsoid14
lu =SLpsogetbound(D,problem);
xmin=lu(1,:);
xmax=lu(2,:);
% pop_size=110;
% iter_max=100;
  maxEVA=2000;
%  maxEVA=1000;
runs=30;
% col_str ={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE'};

% for i=1:1

%   parfor rr=1:runs
   for rr=1:runs
       rr,
%        [gbest,gbestval,everyEVA,everyGBEST,time_output]= RBFSLPSO_func(D,maxEVA,xmin,xmax,problem);
  [gbestval,everyEVA,everyGBEST,time_output]= RBFSLPSOLCB_Func(D,maxEVA,xmin,xmax,problem);
%          xbest{rr,:}=gbest;
           fbest1{:,rr}=gbestval;       
        Gval{:,rr}=everyEVA;
        IEVAC{:,rr}=everyGBEST;
       time(:,rr)=time_output;
        
 end 
     
       fbest=cell2mat(fbest1); 
        best_fit=min(fbest);
        worst_fit=max(fbest);
        f_mean=mean(fbest);
        f_median=median(fbest);
        std_fit=std(fbest);     meantime=mean(time);

out=[best_fit',worst_fit',f_mean',f_median',std_fit',meantime'];

  save(Filename,'Gval','IEVAC','fbest','time','out');
 closeparallelpool;
end