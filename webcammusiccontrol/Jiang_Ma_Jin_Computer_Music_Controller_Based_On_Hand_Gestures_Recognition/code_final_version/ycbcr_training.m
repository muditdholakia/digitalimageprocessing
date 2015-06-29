vid=videoinput('winvideo',1,'YUY2_640x480'); 
triggerconfig(vid, 'manual');
start(vid);
pause(5)
img_o = getsnapshot(vid);

stop(vid);

figure,BW = roipoly(ycbcr2rgb(img_o));
for i = 1:3
    bw2(:,:,i)=BW;
end
bw2 = double(bw2).* double(img_o);
bw2_ycbcr = bw2;
bw2_hsv = rgb2hsv(ycbcr2rgb(uint8(bw2)));
figure, xlim([1 255]),ylim([1 255]),hold on;
for i = 1:3
    temp1 = bw2_ycbcr(:,:,2);
    temp2 = bw2_ycbcr(:,:,3);
    plot(temp1(:),temp2(:),'o','Color','red');
end
hold off;
mask =zeros(255,255);
for x =1: size(BW,1)
    for y= 1:size(BW,2)
        if bw2_ycbcr(x,y,1)>0
            mask(bw2_ycbcr(x,y,3),bw2_ycbcr(x,y,2))=1;
        end
    end
end

[row col] = find(mask==1);
K = convhull(row,col);
convex_mask_training = poly2mask(col(K),row(K),255,255);
save('training.mat', 'convex_mask_training');
figure,imshow(convex_mask_training);
figure,imshow(mask)


    
