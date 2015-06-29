clear all;
close all;
clc;


start=0;
second=10;
mov_name = 'test.avi';
for i=1 : 57
[video, audio] = mmread(mov_name,[],[start second],true,false); 
                         
                          %Check Audio Structure 
                         chkdata=  isempty(audio.data);
                         
                         if chkdata == 1 
                             break;
                         else
                         end
                          
                              f1 = audio.data(:,1)>=0.05;
                            f11(i,1)= sum(f1~=0) ;
                                                  
                               start=second +1  ;
                               Segment = start/10
                              second = second + 10 ;
                                       
                             clear audio;
                             clear video;
end
  
                          figure(12),bar(f11(:,1))
                          title('Movie Video Clip');
                          xlabel('Total No. of Segments');
                          ylabel('Segment Intensity');
                                
                                
                                 cutoff = 100000; 
                                t =1;
                                t1 =size(f11);
                                flag1 =0;
                                while (t <= t1(1,1))
                                    
                                %Song Start Point
                                    if f11(t,1) > cutoff  && flag1 == 0
                                    
                                    song_start =  t ;
                                    song_end = t + 18 ;
                                        flag1 = 1;                         
                                    end
                                     
                                   t =t +1; 
                                end
                s_end =song_end;
                                while (s_end <= t1(1,1))
                                    
                                   if (f11(song_end+1,1) > cutoff )
                                      
                                       song_end = song_end +1;
                                                                            
                                   end
                                    s_end = s_end +1;
                                end
                                
                                song_start = song_start - 2 ;
                                
                                
                                                 %play audio & video Song based on requirement
                                flag= 1;
                                                 while(flag ~= 3)
                     flag=input('Do you want  to play audio or video?(A(1)/V(2)/E(3))');
while(flag == 1)

[video, audio] = mmread(mov_name,[],[(song_start*10) ((song_start*10)+90)],true,false); 
%Set up the reader and writer objects
                                     soundsc(audio.data(:,1), audio.rate);
                                    
                             clear audio;
                             clear video;
 
flag=input('Do you want  to play again ?(y(1)/n(0))');
end

while(flag == 2)
   
rstart = song_start * 10
rstop =  rstart + 30
clear audio;
clear video;
 [video, audio] = mmread(mov_name,[],[rstart rstop]);
 audio.times = audio.times - rstart;
 video.times = video.times - rstart;
 mmplay(video,audio)
 
%mmwrite('TVR.avi',audio,video);
flag=input('Do you want  to play again?(y(2)/n(0))');
end

   
    end
                                
                                
                                