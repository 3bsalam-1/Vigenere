function varargout = vigenere(varargin)
% VIGENERE MATLAB code for vigenere.fig
%      VIGENERE, by itself, creates a new VIGENERE or raises the existing
%      singleton*.
%
%      H = VIGENERE returns the handle to a new VIGENERE or the handle to
%      the existing singleton*.
%
%      VIGENERE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIGENERE.M with the given input arguments.
%
%      VIGENERE('Property','Value',...) creates a new VIGENERE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vigenere_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vigenere_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vigenere

% Last Modified by GUIDE v2.5 19-May-2022 10:59:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vigenere_OpeningFcn, ...
                   'gui_OutputFcn',  @vigenere_OutputFcn, ...
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


% --- Executes just before vigenere is made visible.
function vigenere_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vigenere (see VARARGIN)

% Choose default command line output for vigenere
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vigenere wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = vigenere_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plaintext=get(handles.m,'String');
k = get(handles.k,'String');
lenp = length(plaintext);
lenk = length(k);
key = zeros(1,lenp) ;
    i = 1 ; 
    for j=1 : lenp
        if(plaintext(j)==32)
            key(1,j)=plaintext(j) ;
        else
            key(1,j)=k(i) ;
            i=i+1 ;
            if i>lenk
                i=1 ; 
            end
        end
    end
    ciphertext='' ; 
    for z=1 : lenp
        if(plaintext(z)==32)
            ciphertext(z) = ' ' ; 
            continue ;
        else
            plaintext(z)=plaintext(z)-97 ; 
            key(z) = key(z)-97 ;
            ciphertext(z)=upper(char(mod(plaintext(z)+key(z),26)+97)) ;
        end
    end
    set(handles.r,'String',ciphertext) ;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ciphertext=get(handles.m,'String');
k = get(handles.k,'String');
lenc = length(ciphertext);
lenk = length(k);
    key = zeros(1,lenc) ;
    i = 1 ; 
    for j=1 : lenc
        if(ciphertext(j)==32)
            key(1,j)=ciphertext(j) ;
        else
            key(1,j)=k(i) ;
            i=i+1 ;
            if i>lenk
                i=1 ; 
            end
        end
    end
    plaintext=''; 
    for x=1 : lenc
        if(ciphertext(x)==32)
            plaintext(x) =' '; 
            continue ;
        else
            ciphertext(x)=ciphertext(x)-65 ; 
            key(x) = key(x)-65 ;
            plaintext(x)=upper(char(mod(ciphertext(x)-key(x),26)+65)) ;
        end
    end
    set(handles.r,'String',plaintext) ;



function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c as text
%        str2double(get(hObject,'String')) returns contents of c as a double


% --- Executes during object creation, after setting all properties.
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
