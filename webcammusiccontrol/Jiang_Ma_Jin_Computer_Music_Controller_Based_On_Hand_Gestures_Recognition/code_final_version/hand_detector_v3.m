%hand_detector version3, convex defect based with region enhanced
%call back function

function hand_detector_v3(obj,event)
    [frames time_frames] = getdata(obj);
    user_data = get(obj, 'UserData');
    num_old = 5;
    count_feature_old = zeros(num_old,1);
    if ~isempty(user_data) && isstruct(user_data)
        for i=1:num_old
            count_feature_old(i) = user_data.count_feature_old(i);
        end
    end
    
    
   count_feature = 0;
   sample_frame = frames(:,:,:,1);
   cw1_ycbcr = sample_frame;
   [x y z] = size(cw1_ycbcr);
   static_indicator = false;
   if x>0 && y > 0    
          mask_all = ycbcr_detector(cw1_ycbcr, static_indicator);      
          figure(2),imshow(mask_all), drawnow;
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
                        end
                    end
              end
              if count_feature > 2 && count_feature <5
                  time_frames(1)
                  display hand_detected
              end
%               figure(2),imshow(ycbcr2rgb(cw1_ycbcr)), drawnow;
          end
                  
   end
   flushdata(obj,'all');
   count_feature_old(1:4) = count_feature_old(2:5);
   count_feature_old(5) = count_feature;
   my_data.count_feature_old = count_feature_old;             
   obj.UserData = my_data;     
   count_feature_old
end