
function varargout = frontEnd(varargin)

%	DEMO3 Application M-file for demo3.fig 
%	FIG = DEMO3 launch demo3 GUI. 
%	DEMO3('callback_name', ...) invoke the named callback. 
%	Last Modified by GUIDE v2.0 11-Apr-2003 00:03:25 %cd \ 
%	cd fin 

    if nargin <= 1 % LAUNCH GUI if nargin == 0
        initial_dir = pwd;
    end
    
    if nargin == 1 && exist(varargin{1},'dir')
        initial_dir = varargin{1};
    else
        errordlg('Input argument must be a valid directory','Input Argument Error!') 
        return
    end

    % Open FIG-file
    fig = openfig(mfilename,'reuse'); % Generate a structure of handles to pass to callbacks, and store it.

    % Use system color scheme for figure:
    set(fig,'Color',get(0,'defaultUicontrolBackgroundColor')); 
    handles = guihandles(fig);
    guidata(fig, handles);
    % Populate the listbox 
    load_listbox(initial_dir,handles)
    % Return figure handle as first output argument 
    
    if nargout > 0
        varargout{1} = fig; 
    
    elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK try
        [varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard catch
        disp(lasterr); 
    
    end
end

%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and %|
%| sets objects' callback properties to call them through the FEVAL
%| switchyard above. This comment describes that mechanism. %|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN) %|
%| The subfunction name is composed using the object's Tag and the 
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'. %|
%| H is the callback object's handle (obtained using GCBO). %|
%| EVENTDATA is empty, but reserved for future use. %|
%| HANDLES is a structure containing handles of components in GUI using %| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in %| the figure's application data using GUIDATA. A copy of the structure %| is passed to each callback. You can store additional information in %| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see %| the updates. Type "help guihandles" and "help guidata" for more %| information.
%|
%| VARARGIN contains any extra arguments you have passed to the %| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo)) %| Add any extra arguments after the last argument, before the final
%| closing parenthesis.
% --------------------------------------------------------------------

function varargout = togglebutton1_Callback(h, eventdata, handles, varargin) 
% Stub for Callback of the uicontrol handles.togglebutton1. 
disp('togglebutton1 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton4_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton4. 
    disp('pushbutton4 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton5_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton5. 
    disp('pushbutton5 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton6_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton6. 
    disp('pushbutton6 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton7_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton7. 
    disp('pushbutton7 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton8_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton8.
    disp('pushbutton8 Callback not implemented yet.')  
end
% --------------------------------------------------------------------

function varargout = pushbutton9_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton9. 
    disp('pushbutton9 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton10_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton10. 
    disp('pushbutton10 Callback not implemented yet.')
end
% --------------------------------------------------------------------

function varargout = pushbutton11_Callback(h, eventdata, handles, varargin) 
    % Stub for Callback of the uicontrol handles.pushbutton11. 
    disp('pushbutton11 Callback not implemented yet.')
end
% ------------------------------------------------------------

% Callback for list box - open .fig with guide, otherwise use open % ------------------------------------------------------------

function varargout = listbox1_Callback(h, eventdata, handles, varargin) 
    if strcmp(get(handles.figure1,'SelectionType'),'open')
        index_selected = get(handles.listbox1,'Value'); 
        file_list = get(handles.listbox1,'String'); 
        filename = file_list{index_selected};

        if  handles.is_dir(handles.sorted_index(index_selected))
            cd (filename) 
            load_listbox(pwd,handles)
        
        else
            [path,name,ext,ver] = fileparts(filename); 
            
            switch ext
                case '.fig'
                    guide (filename) 
                otherwise
                    try
                        fn = strcat(pwd,'\',filename);
                        I = imread(fn);
                        % handles; 
                        %figure(get(handles.figure1));
                        %figure('Destination Address Interpretation for
                        %Automating the Sorting Process of Indian Postal
                        %System');
                        %axes(handles.frame10);
                        %subplot(axes(handles.frame10));
                        % axes(handles.axes1);
                        subplot(1,3,1);
                        imshow(I);

                        %axis off;

                        title('Input Character');
                        %figure(1); 
                        fn = strcat(pwd,'\',filename);
                        ra = tcf(fn); 
                        %open(filename)

                    catch
                        errordlg(lasterr,'File Type Error','modal')
                    end
            end
        end
    end
end
% ------------------------------------------------------------

% Read the current directory and sort the names

% ------------------------------------------------------------

function load_listbox(dir_path,handles) 
    cd (dir_path)
    dir_struct = dir(dir_path);

    [sorted_names,sorted_index] = sortrows({dir_struct.name}'); 
    
    handles.file_names = sorted_names;
    handles.is_dir = [dir_struct.isdir]; 
    handles.sorted_index = [sorted_index]; 

    guidata(handles.figure1,handles)

    set(handles.listbox1,'String',handles.file_names,'Value',1) 
    set(handles.text1,'String',pwd)
    
end