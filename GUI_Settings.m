function varargout = GUI_Settings(varargin)
% GUI_Settings MATLAB code for GUI_Settings.fig
%      GUI_Settings, by itself, creates a new GUI_Settings or raises the existing
%      singleton*.
%
%      H = GUI_Settings returns the handle to a new GUI_Settings or the handle to
%      the existing singleton*.
%
%      GUI_Settings('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_Settings.M with the given input arguments.
%
%      GUI_Settings('Property','Value',...) creates a new GUI_Settings or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Settings_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Settings_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Settings

% Last Modified by GUIDE v2.5 30-Oct-2017 09:07:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Settings_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Settings_OutputFcn, ...
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


% --- Executes just before GUI_Settings is made visible.
function GUI_Settings_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Settings (see VARARGIN)

% Choose default command line output for GUI_Settings
handles.output = hObject;
% Added objects
% create the camera object - NEW PART
camera = cameraClass;
% save camera as a field within handles - NEW PART
handles.camera = camera;
 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Settings wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Settings_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% Left sidepane buttons
% --- Executes on button press in settingsButton.
function settingsButton_Callback(hObject, eventdata, handles)
% hObject    handle to settingsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in measureButton.
function measureButton_Callback(hObject, eventdata, handles)
% hObject    handle to measureButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in historyButton.
function historyButton_Callback(hObject, eventdata, handles)
% hObject    handle to historyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stopLaserButton.
function stopLaserButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopLaserButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function settingsMenu_Callback(hObject, eventdata, handles)
% hObject    handle to settingsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function measureMenu_Callback(hObject, eventdata, handles)
% hObject    handle to measureMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function imageWindow_CreateFcn(hObject, eventdata, handles)
%display_image
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in startSystemWithSetParametersButton.
function startSystemWithSetParametersButton_Callback(hObject, eventdata, handles)
myCamera = handles.camera.cameraName;
vidRes = myCamera.VideoResolution;
nBands = myCamera.NumberOfBands ;
%hImage = imagesc( zeros(vidRes(2), vidRes(1), nBands));
hImage = imagesc( zeros(310, 416, nBands));
% Set up the update preview window function.
% Image processing occur here.
setappdata(hImage,'UpdatePreviewWindowFcn',@previewFcn);
% Show the image
preview(myCamera, hImage);
%% new test for this

% hObject    handle to startSystemWithSetParametersButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function test_Callback(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
