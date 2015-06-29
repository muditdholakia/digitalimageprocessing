%skin detector

function mask = hsv_detector(img_o, static_indicator)
    if static_indicator == true
        cw1_hsv = rgb2hsv(img_o);
    else
        cw1_hsv =rgb2hsv(ycbcr2rgb(img_o));
    end
      
    hueThresh=[300/360;80/360];
    satThresh=[0;0.45];
    valThresh=[0;1];
    mask=thresholdHueSaturationValueIntervals(cw1_hsv, hueThresh, satThresh, valThresh);
    mask = imerode(mask,strel('disk',12));
    mask = imdilate(mask,strel('disk',12));
end