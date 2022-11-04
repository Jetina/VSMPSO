function obj=Infill_Standard_EI(posfit,m,gbestval,MNDS)
%--------------------------------------------------------------------------
% the DACE toolbox of  Lophaven et al. (2002)  is used to predict value
%--------------------------------------------------------------------------
% REFERENCES
%Lophaven SN, Nielsen HB, and Sodergaard J, DACE - A MATLAB Kriging
%Toolbox, Technical Report IMM-TR-2002-12, Informatics and Mathematical
%Modelling, Technical University of Denmark, 2002.
%Available at: http://www2.imm.dtu.dk/~hbn/dace/.
%--------------------------------------------------------------------------
% get the Kriging prediction and variance
% [y,mse] = predictor(x,Kriging_model);
s=sqrt(max(0,MNDS));
f_min=repmat(gbestval,m,1);
% calcuate the EI value
EI=(f_min-posfit).*Gaussian_CDF((f_min-posfit)./s)+s.*Gaussian_PDF((f_min-posfit)./s);

% the genetic algorithm tries to minimize the objective
obj=-EI;

end





