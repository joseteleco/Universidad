function sspisxaf(caseid,gf)
%SSPISXAF SSPI 'sxaf' program front-end.
%       SSPISXAF('CASEID') provides a graphical user interface to 
%       the SSPI software package 'sxaf' program.  'CASEID' is 
%       the case identifier assigned to the input signal.  SSPI 
%       files are normally identified by the filename format 
%       'pam_caseid.*'.  Upon startup, SSPISXAF attemts to read
%       the 'pam_caseid.sxaf' file used to store the command-
%       line options for the 'sxaf' program.  If found, the 
%       dialog box values are set to those found in the '.sxaf'
%       file.  If the file has not been created or cannot be found,
%       the dialog box values are set to default values with 
%       the caseid set to 'CASEID'. 
%
%       SSPISXAF opens the dialog box with default values set 
%       and no caseid.  If no caseid has been assigned when the
%       'Save' or 'Execute' pushbuttons are pressed, a default 
%       caseid of 'temp' is used.
%
%       The SSPISXAF program is automatically called if SSPIPAM 
%       suceeds after the SSPIPAM 'Execute' button is pressed.
%
%       See also SSPIPAM, LOADSSPI, LOADSURF

%       Programming note:
%
%       SSPIPAM('CASEID',H) is the proper calling sequence from 
%       the SSPIPAM function where H is the handle of the SSPIPAM
%       figure window.  This is used to ensure only one SSPISXAF
%       window is opened by the same SSPIPAM window (see findfig 
%       code below).
%
%       See also EXECSXAF, SAVESXAF, LOADSXAF.

%       Dennis W. Brown 1-16-94, DWB 1-21-94
%       Naval Postgraduate School, Monterey, CA
%       May be freely distributed.
%       Not for use in commercial products.

if nargin < 2,
     gf = 0;
elseif nargin > 2,
     error('sspisxaf: Invalid number of input arguments...');
end;

% local variables
b_hite = 22;
b_width = 150;
b_int = 5;

rows = (0:6) .* (b_hite + b_int) + 5;
columns = (0:3) .* (b_width + b_int) + 5;

cfore = 'white';
cback = 'blue';
hback = 'magenta';

% get screen size
scz = get(0,'ScreenSize');

% create figure window in upper left corner
%   open a new figure window (use old if present)
%   old window id'd by Name and pam figure window handle
%   stored in Userdata
f = findfig('SSPI SXAF Program Interface',gf);
if isempty(f),

    f = figure('Units','Pixels','Color',cback, ...
            'Position',[30 scz(4)-max(rows)-b_hite-b_int-40 ...
 		max(columns)+b_width+b_int ...
                max(rows)+b_hite+b_int], ...
            'Name','SSPI SXAF Program Interface', ...
 	    'NumberTitle','off','nextplot','new', ...
            'UserData',gf,'Resize','off');
end;
figure(f);

% Case-ID group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(1) rows(7) b_width b_hite], ...
    'String','Case-ID')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore,'String','', ...
    'Position',[columns(2) rows(7) b_width b_hite], ...
    'UserData','Case-ID')

% X-Correlation-File group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(1) rows(6) b_width b_hite], ...
    'String','X-Correlation-File')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore,'String','', ...
    'Position',[columns(2) rows(6) b_width b_hite], ...
    'UserData','X-Correlation-File');

% Output-File (-o) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(1) rows(5) b_width b_hite], ...
    'String','Output-File (-o)')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore,'String','', ...
    'Position',[columns(2) rows(5) b_width b_hite], ...
    'UserData','Output-File');

% Output-Format (-f) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(1) rows(4) b_width b_hite], ...
    'String','Output-Format (-f)')

uicontrol(f,'Style','popupmenu','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'String','ASCII|binary', ...
    'Position',[columns(2) rows(4) b_width b_hite], ...
    'UserData','Output-Format');

% Alphas-File (-a) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(1) rows(3) b_width b_hite], ...
    'String','Alphas-File (-a)')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore,'String','', ...
    'Position',[columns(2) rows(3) b_width b_hite], ...
    'UserData','Alphas-File');

% Input-Points (-m) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(1) rows(2) b_width b_hite], ...
    'String','Input-Points (-m)')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'Position',[columns(2) rows(2) b_width b_hite], ...
    'UserData','Input-Points', ...
    'Callback',['sspi_h = findedit(gcf,''Input-Points'');'...
                'sspi_N = str2num(get(sspi_h,''String''));'...
                'if sspi_N <= 0,' ...
                '  disp(''sspisxaf: Input-Points (-m) must be > 0'');' ...
                '  set(sspi_h,''String'','''');' ...
                'else,' ...
                '  set(sspi_h,''String'',int2str(sspi_N));' ...
                'end;' ...
                ]);

% Max-Cuts (-M) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(3) rows(7) b_width b_hite], ...
    'String','Max-Cuts (-M)')

uicontrol(f,'Style','checkbox','Horiz','left', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'String','Max-Cuts', ...
    'Position',[columns(4) rows(7) b_width b_hite]);

% Conjugate (-C) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(3) rows(6) b_width b_hite], ...
    'String','Conjugate (-C)')

uicontrol(f,'Style','checkbox','Horiz','left', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'String','Conjugate', ...
    'Position',[columns(4) rows(6) b_width b_hite]);

% Surface-Type (-r) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(3) rows(5) b_width b_hite], ...
    'String','Surface-Type (-r)')

uicontrol(f,'Style','popupmenu','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'String','Complex|Magnitude|Phase', ...
    'Position',[columns(4) rows(5) b_width b_hite], ...
    'UserData','Surface-Type');

% Cyclic-Corr (-t) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(3) rows(4) b_width b_hite], ...
    'String','Cyclic-Corr (-t)')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'Position',[columns(4) rows(4) b_width b_hite], ...
    'UserData','Cyclic-Corr', ...
    'Callback',['sspi_h = findedit(gcf,''Sub-Sample'');'...
                'sspi_N = str2num(get(sspi_h,''String''));'...
                'if sspi_N <= 0,' ...
                '  disp(''sspisxaf: Samples-per-symbol must be > 0'');' ...
                '  set(sspi_h,''String'','''');' ...
                'else,' ...
                '  set(sspi_h,''String'',int2str(sspi_N));' ...
                'end;' ...
                ]);

% Sub-Sample (-s) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(3) rows(3) b_width b_hite], ...
    'String','Sub-Sample (-s)')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'Position',[columns(4) rows(3) b_width b_hite], ...
    'UserData','Sub-Sample', ...
    'Callback',['sspi_h = findedit(gcf,''Sub-Sample'');'...
                'sspi_N = str2num(get(sspi_h,''String''));'...
                'if sspi_N <= 0,' ...
                '  disp(''sspisxaf: Samples-per-symbol must be > 0'');' ...
                '  set(sspi_h,''String'','''');' ...
                'else,' ...
                '  set(sspi_h,''String'',int2str(sspi_N));' ...
                'end;' ...
                ]);

% Smooth-Window (-w) group
uicontrol(f,'Style','text','Horiz','right', ...
    'BackGround',cback,'ForeGround',cfore, ...
    'Position',[columns(3) rows(2) b_width b_hite], ...
    'String','Smooth-Window (-w)')

uicontrol(f,'Style','edit','Horiz','right', ...
    'BackGround',hback,'ForeGround',cfore, ...
    'Position',[columns(4) rows(2) b_width b_hite], ...
    'UserData','Smooth-Window', ...
    'Callback',['sspi_h = findedit(gcf,''Smooth-Window'');'...
                'sspi_N = str2num(get(sspi_h,''String''));'...
                'if sspi_N < 0,' ...
                '  disp(''sspisxaf: Smooth-Window (-w) must be >= 0'');' ...
                '  set(sspi_h,''String'','''');' ...
                'else,' ...
                '  set(sspi_h,''String'',num2str(sspi_N));' ...
                'end;' ...
                ]);

% load pushbutton
uicontrol(f,'Style','pushbutton','Horiz','center', ...
    'ForeGround',cfore,'String','Load', ...
    'Position',[columns(1) rows(1) b_width b_hite], ...
    'CallBack',['sspi_f = gcf; set(sspi_f,''Pointer'',''watch''); ' ...
               'loadsxaf(sspi_f); set(sspi_f,''Pointer'',''arrow'');']);

% save pushbutton
uicontrol(f,'Style','pushbutton','Horiz','center', ...
    'ForeGround',cfore,'String','Save', ...
    'Position',[columns(2) rows(1) b_width b_hite], ...
    'CallBack',['sspi_f = gcf; set(sspi_f,''Pointer'',''watch''); ' ...
               'savesxaf(sspi_f); set(sspi_f,''Pointer'',''arrow'');']);

% Execute pushbutton
uicontrol(f,'Style','pushbutton','Horiz','center', ...
    'ForeGround',cfore,'String','Execute', ...
    'Position',[columns(3) rows(1) b_width b_hite], ...
    'CallBack',['sspi_f = gcf; set(sspi_f,''Pointer'',''watch''); ' ...
               'execsxaf(sspi_f); set(sspi_f,''Pointer'',''arrow'');']);

% Close pushbutton
uicontrol(f,'Style','pushbutton','Horiz','center', ...
    'ForeGround',cfore,'String','Quit', ...
    'Position',[columns(4) rows(1) b_width b_hite], ...
    'CallBack',[ ...
	'close;' ...
	]);


% default values
set(findedit(f,'Case-ID'),'String','default');
set(findedit(f,'X-Correlation-File'),'String','none');
set(findedit(f,'Output-File'),'String','surf_out');
set(findpopu(f,'Output-Format'),'Value',2);
set(findedit(f,'Alphas-File'),'String','alphas');
set(findedit(f,'Input-Points'),'String','0');

set(findchkb(f,'Max-Cuts'),'Value',0);
set(findchkb(f,'Conjugate'),'Value',0);
set(findpopu(f,'Surface-Type'),'Value',1);
set(findedit(f,'Cyclic-Corr'),'String','0');
set(findedit(f,'Sub-Sample'),'String','10');
set(findedit(f,'Smooth-Window'),'String','5.0');

if nargin > 0,

    set(findedit(f,'Case-ID'),'String',caseid);
    set(findedit(f,'Output-File'),'String',['pam_' caseid '.surf']);
    loadsxaf(f);

end;
