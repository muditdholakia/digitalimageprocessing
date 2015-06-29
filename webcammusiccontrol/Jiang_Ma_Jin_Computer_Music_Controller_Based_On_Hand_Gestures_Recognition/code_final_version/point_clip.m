%point boundary
function [get_x get_y] = point_clip (boundary_x, boundary_y , input_x, input_y)
   floor_x = round(input_x);
   floor_y = round(input_y);
   if floor_x > boundary_x
       get_x = boundary_x;
   elseif floor_x < 1
       get_x = 1;
   else
       get_x = floor_x;
   end
   
   if floor_y > boundary_y
       get_y = boundary_y;
   elseif floor_y < 1
       get_y = 1;
   else
       get_y = floor_y;
   end
end