clear all;
close all;
clc;
 
[video, audio] = mmread('Movie 1.avi');
%[video, audio] = mmread('sumo.flv');

 nnn =size(video.frames);
 numFrames = nnn(1,2) 
 

 for i = 1: numFrames -1 
     F1 =video.frames(1,i).cdata ;
F2 = video.frames(1,i+1).cdata;

 
 l1 = rgb2gray(F1);
 
 l2 = rgb2gray(F2);
 

ans1(i,1) = corr2(l1,l2);

 if i == 5 
      figure(i),imshow(F2);
     title('fisrt shot');
     count =1;
 end

 if ans1(i,1) < 0.9
     figure(i),imshow(F2);
     title('shot change');
     count =count +1;
 end
 
 
 
    
 end         
 
 
 fprintf('total no. shots');
 count