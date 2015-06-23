clear all
close all
clc;
[video, audio] = mmread('sumo.flv',[],[]);
med =8;
for i=1:18:769
    med1 = med + i;
    keyframe = video.frames(1,med1).cdata; 
    imshow(keyframe);
    pause(1)
    
end