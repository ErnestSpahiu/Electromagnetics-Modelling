clc;
clear;  
O=[0 0 0];
R1=[1 2 3];
R2=[3 2 1];

R1_R2_dot = dot(R1,R2);
R2_R2_dot = dot(R2,R2);

R1_proj_R2 = (R1_R2_dot/R2_R2_dot)*R2;

MagnR1 = norm(R1);
MagnR2 = norm(R2);

CosThetaR1_R2 = (R1_R2_dot)/(MagnR1 * MagnR2);
AngleR1_R2 = acos(CosThetaR1_R2);