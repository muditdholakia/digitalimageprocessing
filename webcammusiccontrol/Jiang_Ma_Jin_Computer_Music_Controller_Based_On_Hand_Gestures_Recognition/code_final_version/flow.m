
%control flow
vid=videoinput('winvideo',1,'YUY2_640x480'); 
old_frames = [];
vid.FramesPerTrigger = 5;
set(vid,'TriggerRepeat',Inf);
load 'training.mat';
global convex_mask_training;
convex_mask_training = imdilate(convex_mask_training,strel('disk',4));

%% set up Windows Media Player
frame = figure(1);
player = actxcontrol('WMPlayer.ocx.7',[0 0 600 500],frame);

playlist = player.newPlaylist('My Playlist', '');
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\1.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\2.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\3.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\4.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\5.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\6.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\7.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\8.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\9.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\10.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\11.mp3'));
playlist.appendItem(player.newMedia('C:\Users\Public\Music\Sample Music\12.mp3'));
player.currentPlaylist = playlist;
%%

set(vid,'FramesAcquiredFcnCount', 5);
set(vid,'FramesAcquiredFcn', {'detector', player});
% set(vid,'FramesAcquiredFcn', {'finger_detector_area', player});
% set(vid,'FramesAcquiredFcn', {'finger_detector_tip', player});
frames_per_trigger = 1;
vid.FrameGrabInterval = frames_per_trigger;
warning off;
start(vid);