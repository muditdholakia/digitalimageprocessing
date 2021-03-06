clear all;
close all;
clc;

videoFReader = vision.VideoFileReader('visiontraffic.avi');
videoFWriter = vision.VideoFileWriter('myfile.avi','FrameRate',videoFReader.info.VideoFrameRate);

while ~isDone(videoFReader)
    videoFrame = step(videoFReader);
    step(videoFWriter, videoFrame);
end

%Close the file reader and video player.

release(videoFReader);
release(videoFWriter);