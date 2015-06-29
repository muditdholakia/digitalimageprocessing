clear all
clc
close all

% You can customize and fix initial directory paths
TrainDatabasePath = uigetdir('F:\Temp\VIDEO Processing STTP materail\STTP Material\TVR\Session7\PCA_based Face Recognition System\PCA_based Face Recognition System\originalTrainDatabase', 'Select training database path' );
TestDatabasePath = uigetdir('F:\Temp\VIDEO Processing STTP materail\STTP Material\TVR\Session7\PCA_based Face Recognition System\PCA_based Face Recognition System\originalTestDatabase', 'Select test database path');

prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
size(TestImage)
im = imread(TestImage);
im=imresize(im,[100 100]);
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
