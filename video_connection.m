% Establish video connection between Matlab code
% and image aquisition toolbox

vid = videoinput('pointgrey', 1, 'F7_Mono8_2080x1552_Mode0');
src = getselectedsource(vid);
<<<<<<< HEAD
=======

<<<<<<< HEAD
>>>>>>> parent of 40ee437... Rearrange of files and folders
=======
>>>>>>> parent of 40ee437... Rearrange of files and folders
%% Set triggering options
triggerconfig(vid, 'immediate');
%% Settings
vid.FramesPerTrigger = 1;

%% Setting up the figure for the image

%% Start image aquisition toolbox
start(vid)
%trigger(vid)
image1 = getdata(vid);
save('image1.mat', 'image1');
%clear image1;
stop(vid)

%% Test to show the aquired data
imtool(image1)
%% Take one or several images
%isrunning(vid)

%isrunning(vid)

%% Test: All code generated OK ?
generated_code_OK = 1