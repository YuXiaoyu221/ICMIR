clc,clear

for ni=1:3
    Multidata(:,:,:,ni)=imread(['.\data\I',num2str(ni),'_cloud','.tif']);
    Multimask(:,:,ni)=imread(['.\data\I',num2str(ni),'_cloudmask','.tif']);
end

tic
Multidata_out=MultiImage_Reconstruction_with_Isophote_Constraint_1(Multidata,Multimask);
toc

for ni=1:3
    imwrite(Multidata_out(:,:,:,ni),['.\data\I',num2str(ni),'_result','.tif']);
end