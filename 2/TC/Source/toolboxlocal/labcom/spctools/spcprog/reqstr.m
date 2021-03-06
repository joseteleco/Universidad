function reqstr(gf,str)
%REQSTR   String request dialog.
%       REQSTR(H,'STRING') opens a dialog box with a uicontrol 
%       text object displaying the 'STRING' user prompt, an edit
%       uicontrol for user response and 'OK' and 'Cancel' 
%       pushbuttons.  The dialog box is actually a frame object
%       that obnoxiously covers a good portion of the figure 
%       window pointed to by the handle H.  The user can click 
%       in the edit box, type a response and then press return 
%       or click on the 'OK' pushbutton.  Either of these 
%       responses will store the entered string in the UserData 
%       property of the 'Workspace' menu.  The dialog box is 
%       then "closed" and the callback function stored in the 
%       UserData property of the figure's CurrentMenu is executed.
%       The current menu is presumed to have initiated the call 
%       to REQSTR.  If the 'Cancel' button is chosen, the dialog
%       closes and the callback function is not evaluated.  An
%       invisible uicontrol 'text' object named 'Answer' is used 
%	to pass the string back to the calling function in the 
%       'UserData' field of 'Answer'.  Note this 
%       dialog is not modal but hopefully is obnoxious enough 
%       that the user will respond to it instead of doing 
%       something else.
%
%
%       See also WORKMENU, SAVEEDIT, LOADEDIT

%       Dennis W. Brown 1-31-94
%       Copyright (c) 1994 by Dennis W. Brown
%       May be freely distributed.
%       Not for use in commercial products.

if nargin ~= 2,
    error('reqstr: Invalid number of input arguments.');
end;

% create a text uicontrol to pass the value back
ha = finduitx(gf,'Answer');
if isempty(ha),
	ha = uicontrol(gf,'Style','text','Units','normal',...
	'Position',[0 0 .1 .1],...
	'String','Answer','Visible','off'...
	);
end;

% clearing function
cancelcall = [...
    'delete(findfram(gcf,''reqstr''));' ...
    'delete(finduitx(gcf,'''',''reqstr''));' ...
    'delete(findedit(gcf,''reqstr''));' ...
    'delete(findpush(gcf,''OK''));' ...
    'delete(findpush(gcf,''Cancel''));' ...
    ];

% presumably the calling function, stores this handle in 
% the OK button so the callback function can find it
h = get(gf,'CurrentMenu');

% user responded properly, store the string and call the calling
%   callback from the menu whose handle is in the OK button
okcall = [...
    'if isempty(get(findedit(gcf,''reqstr''),''String'')), ' ...
       'return; end;' ...
    'set(finduitx(gcf,''Answer''),''UserData'', ' ...
       'get(findedit(gcf,''reqstr''),''String'')); ' ...
       'dog_call = get(findpush(gcf,''OK''),''UserData'');' ...
    ];

enablecall = [...
	'dog_h = findobj(get(gcf,''children''),''Type'',''uicontrol'');'...
	'set(dog_h,''Enable'',''on'');'...
	'dog_h = findobj(get(gcf,''children''),''Type'',''uimenu'');'...
	'set(dog_h,''Enable'',''on'');'...
	'clear dog_h;'...
];

% evaluate the calling functions
evalcall = [...
    'eval(get(dog_call,''UserData''));' ...
    ];

% local variables
sp = .05/3;
bt = sp/2;

% disable all existing uicontrols
hh = findobj(get(gcf,'children'),'Type','uicontrol');
set(hh,'Enable','off');

% disable all existing uimenus
hh = findobj(get(gcf,'children'),'Type','uimenu');
set(hh,'Enable','off');

% draw the controls
uicontrol(gf,...
    'Units','normal',...
    'Style','frame',...
    'String','reqstr',...
    'Position',[.1 .4 .8 .2]);

uicontrol(gf,...
    'Units','normal',...
    'Style','text',...
    'Position',[.2 .4+bt+2*sp+.1 .6 .05],...
    'Horiz','left',...
    'UserData','reqstr',...
    'String',str);

uicontrol(gf,...
    'Units','normal',...
    'Style','edit',...
    'Position',[.2 .4+bt+sp+.05 .6 .05],...
    'Horiz','left',...
    'ForeGroundColor','white',...
    'BackGroundColor','black',...
    'UserData','reqstr',...
    'String','',...
    'Callback',[ okcall cancelcall enablecall evalcall 'clear dog_call']);

uicontrol(gf,...
    'Units','normal',...
    'Style','push',...
    'Position',[.3 .4+bt .1 .05],...
    'Horiz','center',...
    'String','Cancel',...
    'CallBack',[cancelcall enablecall]);

uicontrol(gf,...
    'Units','normal',...
    'Style','push',...
    'Position',[.6 .4+bt .1 .05],...
    'Horiz','center',...
    'String','OK',...
    'UserData',h,...
    'CallBack',[okcall cancelcall enablecall evalcall 'clear dog_call']);

