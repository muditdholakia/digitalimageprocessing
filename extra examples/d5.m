close all;
clear all;
clc;



bw = [0 0 0 0 0 0
      0 0 1 1 0 0
      0 1 1 1 1 0
      0 1 1 1 1 0
      0 0 1 1 0 0
      0 0 1 0 0 0];

interval = [0 -1 -1
            1  1 -1
            0  1  0];

bw2 = bwhitmiss(bw,interval);

