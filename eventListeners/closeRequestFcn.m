function varargout = closeRequestFcn(varargin)
% CLOSEREQUESTFCN MATLAB code for closeRequestFcn.fig
%      CLOSEREQUESTFCN, by itself, creates a new CLOSEREQUESTFCN or raises the existing
%      singleton*.
%
%      H = CLOSEREQUESTFCN returns the handle to a new CLOSEREQUESTFCN or the handle to
%      the existing singleton*.
%
%      CLOSEREQUESTFCN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLOSEREQUESTFCN.M with the given input arguments.
%
%      CLOSEREQUESTFCN('Property','Value',...) creates a new CLOSEREQUESTFCN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before closeRequestFcn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to closeRequestFcn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help closeRequestFcn

% Last Modified by GUIDE v2.5 24-Oct-2017 11:23:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @closeRequestFcn_OpeningFcn, ...
                   'gui_OutputFcn',  @closeRequestFcn_OutputFcn, ...
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


% --- Executes just before closeRequestFcn is made visible.
function closeRequestFcn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to closeRequestFcn (see VARARGIN)

% Choose default command line output for closeRequestFcn
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes closeRequestFcn wait for user response (see UIRESUME)
% uiwait(handles.MyCameraGUI);


% --- Outputs from this function are returned to the command line.
function varargout = closeRequestFcn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when user attempts to close MyCameraGUI.
function MyCameraGUI_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to MyCameraGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in startStopCamera.
function startStopCamera_Callback(hObject, eventdata, handles)
% hObject    handle to startStopCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in captureImage.
function captureImage_Callback(hObject, eventdata, handles)
% hObject    handle to captureImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
