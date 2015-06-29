%hand detector_v4 motion based
function detector(obj,event,player)
    [frames time] = getdata(obj);
    numframes = size(frames, 4);
    user_data = get(obj, 'UserData');
    old_frames = [];
    old_diff = [];
    num_old = numframes;
    step = 1;
    if num_old >0
        count_feature_old = zeros(num_old,1);
    end
    if ~isempty(user_data) && isstruct(user_data)
        for i=1:num_old
            count_feature_old(i) = user_data.count_feature_old(i);
        end
        old_frames = user_data.old_frames;
        old_diff = user_data.old_diff;
    else
        my_data.state = 0;
        user_data = my_data;
    end
    v_feature = 0;
    x = size(frames(:,:,:,1),1);
    num_old_frames = size(old_frames,4);
    num_diff = size(old_diff,3);

    regions =[];
    if numframes > 0  && num_old_frames ==numframes
        for j=1:step:numframes
            v_feature = 0;
            diff  = imabsdiff(rgb2gray(frames(:,:,:,j)),rgb2gray(old_frames(:,:,:,j)));
            thresh= max([graythresh(diff); 0.02]);
            bw = (diff >= thresh*255);
            bw = bwareaopen(bw, 20, 8);
            bw = imdilate(bw,strel('disk',2));
            figure(2); imshow(bw),drawnow;
            regions=bwlabel(bw);
            props=regionprops(regions,'Eccentricity','Area','Orientation','Centroid');

            for i = 1:length(props)
                center = props(i).Centroid;
                if ~(props(i).Eccentricity < 0.9 || props(i).Area < 200 || props(i).Area > 5000 || center(2) > x*2/3)
                    if (props(i).Orientation > 45 || props(i).Orientation < -45 )
                        v_feature = v_feature +1;
                    end
                else
                    idx = find(regions == i);
                    regions(idx) = 0;
                end
            end
            count_feature_old(j) = v_feature;
        end

    end
    move_list =zeros(numframes-1,1);
    move_threshold = 120;
    movement = 0;
    next_indicator = true;
    if numframes > 0  
        for k = numframes:-1:1
            g(:, :, k) = rgb2gray(frames(:, :, :, k));
        end
        for k = numframes-1:-1:1
            d(:, :, k) = imabsdiff(g(:, :, k), g(:, :, k+1));
        end
     
        thresh = max(graythresh(d),0.02);
        bw2 = (d >= thresh * 255);        
        bw2 = bwareaopen(bw2, 60, 8);
        sum_area = zeros(numframes-1,1);
        for kk=1:numframes-2
            temp = bw2(:,:,kk);
            sum_area=sum(temp(:));
        end
        [movement index_m] = max(sum_area);
   
        try 
            %figure(3),imshow(bw2(:,:,index_m)),drawnow;
            
            pos_end = bwconvhull(bw2(:,:,numframes-1));
            props_end = regionprops(bwlabel(pos_end),'Centroid');
           
            pos_begin = bwconvhull(bw2(:,:,index_m));
            props_begin = regionprops(bwlabel(pos_begin),'Centroid');
            if props_begin(1).Centroid(1) < props_end(1).Centroid(1)
                next_indicator = false;
            end
        catch e
        end        
    end

    flushdata(obj,'all');
    my_data.count_feature_old = count_feature_old;
    my_data.old_frames = frames;
    my_data.state = user_data.state;
    my_data.old_diff = old_diff;
    hand_detected = 0;

    if mean(count_feature_old)>=5 && mean(count_feature_old) <=10
        hand_detected = 1;
    elseif (count_feature_old(3)>=5 && count_feature_old(3)<=10 && count_feature_old(4)>=5 && count_feature_old(4)<=10 && count_feature_old(5)>=5 && count_feature_old(5)<=10)
        hand_detected = 1;
    end
    move_list;
    movement;
    
    mm = [move_list;movement];
    [aa bb] = max(abs(mm));
    movement = mm(bb);
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
    
    if movement > 35000 && user_data.state == 0
        if strcmp(player.playState, 'wmppsPaused')
            player.Controls.play;
        end
        if next_indicator
            player.Controls.next;
        else
            player.Controls.previous;
        end
    end

    % Store data back to obj.UserData
    obj.UserData = my_data;
end