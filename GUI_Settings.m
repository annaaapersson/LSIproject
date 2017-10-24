function varargout = GUI_Settings(varargin)
% GUI_LINA MATLAB code for GUI_Lina.fig
%      GUI_LINA, by itself, creates a new GUI_LINA or raises the existing
%      singleton*.
%
%      H = GUI_LINA returns the handle to a new GUI_LINA or the handle to
%      the existing singleton*.
%
%      GUI_LINA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LINA.M with the given input arguments.
%
%      GUI_LINA('Property','Value',...) creates a new GUI_LINA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Lina_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Lina_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Lina

% Last Modified by GUIDE v2.5 24-Oct-2017 16:53:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Lina_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Lina_OutputFcn, ...
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


% --- Executes just before GUI_Lina is made visible.
function GUI_Lina_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Lina (see VARARGIN)

% Choose default command line output for GUI_Lina
handles.output = hObject;

% Added objects
% create the camera object - NEW PART
camera = cameraClass;
% save camera as a field within handles - NEW PART
handles.camera = camera;
 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Lina wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Lina_OutputFcn(hObject, eventdata, handles) 
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
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% HERE Lina
% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
%display_image
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in startSystemWithSetParametersButton.
function startSystemWithSetParametersButton_Callback(hObject, eventdata, handles)
myCamera = handles.camera.cameraName;
measure(myCamera);
for i=1:50
    myCamera = handles.camera.cameraName;
    measure(myCamera);
end
% hObject    handle to startSystemWithSetParametersButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% hObject    handle to startRecordingButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

