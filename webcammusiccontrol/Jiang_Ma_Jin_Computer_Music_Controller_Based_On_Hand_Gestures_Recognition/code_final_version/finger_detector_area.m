%hand_detector version3, convex defect based with region enhanced
%call back function

function finger_detector_area(obj, event, player)
    [frames time_frames] = getdata(obj);
    user_data = get(obj, 'UserData');
    if isempty(user_data)
        my_data.state = 0;
        user_data = my_data;
    end
    sample_frame = frames(:,:,:,1);
    cw1_ycbcr = sample_frame;
    [x y z] = size(cw1_ycbcr);
    static_indicator = false;
    if x>0 && y > 0
        mask_all = ycbcr_detector(cw1_ycbcr, static_indicator);
        max_i = 0;
        max_a =0;
        regions=bwlabel(mask_all);
        props=regionprops(regions,'Area','ConvexHull');
        for i = 1:length(props)
            idx = find(regions == i);
            area = props(i).Area;
            if (area < 1000)
                regions(idx) = 0;
            else
                if area > max_a
                    max_a = area;
                    max_i = i;
                end
            end
        end
        if max_i > 0
            convex_region = props(max_i).ConvexHull;
            convex_mask = poly2mask(convex_region(:,1),convex_region(:,2),x,y);
            op = convex_mask-regions > 0;
            regions=bwlabel(op);
            props=regionprops(regions,'Area','Eccentricity','MajorAxisLength','Orientation','Centroid');
            count_feature = 0;
            for i = 1:length(props)
                idx = find(regions == i);
                area = props(i).Area;
                eccentricity = props(i).Eccentricity;
                centroidY=props(i).Centroid(2);
                if area < 1000 || eccentricity < 0.9 || centroidY > y/2
                    regions(idx) = 0;
                else
                    if  props(i).MajorAxisLength > 150 && (props(i).Orientation < -60 || props(i).Orientation > 60)
                        count_feature = count_feature+1;
                    else
                        regions(idx)=0;
                    end
                end
            end
            figure(3),imshow(regions),drawnow;
            hand_detected = 0;
            count_feature
            if count_feature > 2 && count_feature <5
                hand_detected = 1;
            end
            
            my_data.state = user_data.state;
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
            %figure(2), imshow(ycbcr2rgb(cw1_ycbcr)), drawnow;
        else
            flushdata(obj,'all');
            return;
        end
    end
    obj.UserData = my_data;
    flushdata(obj,'all');
end