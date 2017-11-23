function varargout = GUItest(varargin)
% GUITEST MATLAB code for GUItest.fig
%      GUITEST, by itself, creates a new GUITEST or raises the existing
%      singleton*.
%
%      H = GUITEST returns the handle to a new GUITEST or the handle to
%      the existing singleton*.
%
%      GUITEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITEST.M with the given input arguments.
%
%      GUITEST('Property','Value',...) creates a new GUITEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUItest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUItest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUItest

% Last Modified by GUIDE v2.5 20-Nov-2017 09:15:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUItest_OpeningFcn, ...
                   'gui_OutputFcn',  @GUItest_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});    
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUItest is made visible.
function GUItest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUItest (see VARARGIN)

% Choose default command line output for GUItest
handles.output = hObject;

% create the camera object
camera = webcameraClass;

% create the ROI object
ROI1 = ROIClass(480/5,640/5);
ROI2 = ROIClass(480/5,640/5);

% create the plot object
plotObject = plotClass(1, 1);

% Create the contrast object
% contrastObject5 = contrastClass(480, 640, 5);

% save objects as a field within handles
handles.camera = camera;

handles.ROI1 = ROI1;
handles.ROI2 = ROI2;

handles.plotObject = plotObject;

% handles.contrastObject5 = contrastObject5;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUItest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUItest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% preview(cam) %Not needed
% I = imshow(zeros(10));
while (1)
% tic;

% Capture raw image
captureImage(handles.camera);
% Calculate contrast image
contrastImage = calculateContrastPreMatrix(handles.camera.rawImage,5);

% contrastImage = calContrast(handles.contrastObject5, handles.camera.rawImage, 5);


% Displays the image
setDisplayImage(handles.camera, contrastImage, handles.axes1);

if handles.ROI1.activate == 1 % Check if box is marked
% Calculates mean of ROI
    value1 = calculateMeanROI(handles.ROI1, contrastImage)
    value2 = calculateMeanROI(handles.ROI2, contrastImage);
% Inserts the values in ROI class
    insertValueROI1(handles.plotObject, value1, value2)
% Plot the values
    plotValues(handles.plotObject, handles.axes2)
end

% toc
end


% --- Executes on button press in ROI.
function ROI_Callback(hObject, eventdata, handles)
% hObject    handle to ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Create the imrect object
e = imrect(gca,[]);
% Creates a mask around the marked area with ones
handles.ROI1.matrix = createMask(e,handles.camera.image);
e = imrect(gca,[]);
handles.ROI2.matrix = createMask(e,handles.camera.image);


% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% close(handles.camera.src)
close all 
clear all
% closePreview(handles.camera.src)
% clear(handles.camera.src) % stop cam



% --- Executes on button press in checkROI1.
function checkROI1_Callback(hObject, eventdata, handles)
% hObject    handle to checkROI1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.ROI1.activate == 1
    handles.ROI1.activate = 0;
else
    handles.ROI1.activate = 1;
end

% Hint: get(hObject,'Value') returns toggle state of checkROI1


% --- Executes on button press in checkROI2.
function checkROI2_Callback(hObject, eventdata, handles)
% hObject    handle to checkROI2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkROI2
if handles.ROI2.activate == 1
    handles.ROI2.activate = 0;
else
    handles.ROI2.activate = 1;
end
