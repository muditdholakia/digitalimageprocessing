%ycbcr detector

function mask =ycbcr_detector(img_o, static_indicator)
    if static_indicator == true
        cw1_ycbcr = rgb2ycbcr(img_o);
    else
        cw1_ycbcr = img_o;
    end
     
    [x y z] = size(cw1_ycbcr);
    mask=zeros(x,y);
    for i = 1:x
        for j=1:y
            yy = (double(cw1_ycbcr(i, j, 1))-16)/219*255;
            cb =( double(cw1_ycbcr(i, j, 2))-16)/224*255;
            cr = ( double(cw1_ycbcr(i, j, 3))-16)/224*255;
            cb = cb - 109;
            cr = cr - 152;
            x1 = (819 * cr - 614 * cb) / 32 + 51;
            y1 = (819 * cr + 614 * cb) / 32 + 77;
            x1 = x1 * 41 / 1024;
            y1 = y1 * 73 / 1024;
            value = x1 * x1 + y1 * y1;
            if (yy < 100)
                if value < 900%700
                    mask(i, j)  = 255;
                else
                    mask(i, j) =0;
                end
            else
               if value < 1050 %850
                    mask(i, j)  = 255;
               else
                    mask(i, j) =0;
               end
            end
        end
    end

%     mask = imerode(mask,strel('disk',4));
%     mask = imdilate(mask,strel('disk',6));
end