clear all
close all
clc
imaqhwinfo('winvideo')

% Running previous command gives output like this.
% See the device ID
% If multiple devices with camera module are presnt then select appropriate
% device ID. ( If USB webcam is attached and we want to use USB Cam, its 
% device id shuold be used in next command)
% ans = 
% 
%        AdaptorDllName: [1x81 char]
%     AdaptorDllVersion: '4.5 (R2013a)'
%           AdaptorName: 'winvideo'
%             DeviceIDs: {[1]}
%            DeviceInfo: [1x1 struct]
% Here we are getting deviceID 1 so in command videoinput we will use 1

vidobj = videoinput('winvideo',3);
frame = getsnapshot(vidobj);
imshow(frame)
imwrite(frame, 'capturedimage.jpg' , 'jpg');
