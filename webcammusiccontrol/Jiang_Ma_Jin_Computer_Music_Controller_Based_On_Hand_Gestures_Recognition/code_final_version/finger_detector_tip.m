%finger_detector version2, convex defect based
%call back function

function finger_detector_tip(obj, event, player)
    sample_frame = peekdata(obj,1);
    user_data = get(obj, 'UserData');
    if isempty(user_data)
        my_data.state = 0;
        user_data = my_data;
    end
    cw1_ycbcr = sample_frame;
    [x y z] = size(cw1_ycbcr);
    static_indicator = false;
    
    my_data.state = user_data.state;
    if x>0 && y>0
        mask = ycbcr_detector_training(cw1_ycbcr, static_indicator);
        mask_all = mask;

        [regions num_regions]=bwlabel(mask_all);
        props=regionprops(regions,'Area');
        for i = 1:length(props)
            idx = find(regions == i);
            area = props(i).Area;
            if (area < 1000)
                regions(idx) = 0;
            end
        end
        [regions num_regions]=bwlabel(regions);
        props=regionprops(regions,'Area');
        max_i = 0;
        max_a =0;
        for i = 1:length(props)
            area = props(i).Area;
            if area > max_a
                max_a = area;
                max_i = i;
            end
        end
        props=regionprops(regions,'ConvexHull');
        if max_i > 0
            convex_region = props(max_i).ConvexHull;
        end
        convex_mask = poly2mask(convex_region(:,1),convex_region(:,2),x,y);
        new_mask = zeros(size(convex_mask));
        op = convex_mask-regions > 0;

        [regions num_regions]=bwlabel(op);

        props=regionprops(regions,'Extrema');
        extreme_mask = zeros(size(regions));
        %figure(2), imshow(ycbcr2rgb(cw1_ycbcr)), hold on, drawnow;
        %figure(2), imshow(mask_all), hold on, drawnow;
        for i = 1:length(props)
            idx = find(regions == i);
            extrema = props(i).Extrema;
            if regions(idx) > 0
                for j=1:8
                    [tmp_x tmp_y] = point_clip(x, y, extrema(j,1),extrema(j,2));
                    extreme_mask(tmp_y,tmp_x)=1;
                    %plot(extrema(j,1),extrema(j,2),'o','LineWidth',3);
                end
            end
        end
        extreme_mask = imdilate(extreme_mask,strel('disk', 15));
        [regions num_regions]=bwlabel(extreme_mask);
        props=regionprops(regions,'Centroid');
        length(props)
        for i = 1:length(props)
            idx = find(regions == i);
            center = props(i).Centroid;
            plot(center(1),center(2),'o','LineWidth',3);
        end
        hold off;
        
        hand_detected = 0;
        if length(props) > 5 && length(props) < 10
            hand_detected = 1;
        end
        
        if hand_detected
            if user_data.state == 0
                my_data.state = 2;
                beep on, beep, beep off;
                if strcmp(player.playState, 'wmppsPlaying')
                    player.Controls.pause;
                else
                    player.Controls.play;
                end
            end
        else
            my_data.state = max(0, user_data.state-1);
        end

    end
    obj.UserData = my_data;
    flushdata(obj,'all');
end