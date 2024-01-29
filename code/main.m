clc, clear
str_tif='.tif';
I_str='I1'; 
J_str='I2';
Imask_str='I1_mask';
Jmask_str='I2_mask';
%% =============================== data 1: 1_Simulated Data 1 (Both I1 and I2 are obscured by clouds)=============================== 
%%% Image Cloud Removal using Isophote Constraint
str_InputPath='..\data\TestData_1';
I=imread([str_InputPath,'\',I_str,'_SimuClouds',str_tif]);
J=imread([str_InputPath,'\',J_str,'_SimuClouds',str_tif]);
I_mask=imread([str_InputPath,'\',Imask_str,str_tif]);
J_mask=imread([str_InputPath,'\',Jmask_str,str_tif]);
[OutputData_II,OutputData_JJ]=Image_Cloud_Removal_with_Minimum_Gradient_Constraint(I,I_mask,J,J_mask);
%%% output the result to specified path
imwrite((OutputData_II),[str_InputPath,'\',I_str,'-Result_of_ICCR',str_tif]);
imwrite((OutputData_JJ),[str_InputPath,'\',J_str,'-Result_of_ICCR',str_tif]);
%% =============================== data 2: 2_Simulated Data 1 (Image I2 is cloud-free)=============================== 
%%% Image Cloud Removal using Isophote Constraint
str_InputPath='..\data\TestData_2';
I=imread([str_InputPath,'\',I_str,'_SimuClouds',str_tif]);
J=imread([str_InputPath,'\',J_str,str_tif]);
I_mask=imread([str_InputPath,'\',Imask_str,str_tif]);
J_mask=I_mask*0; % Reference image J0 is Cloud-free
%%% output the result to specified path
[OutputData_II,~]=Image_Cloud_Removal_with_Minimum_Gradient_Constraint(I,I_mask,J,J_mask);
imwrite((OutputData_II),[str_InputPath,'\',I_str,'-Result_of_ICCR',str_tif]);
