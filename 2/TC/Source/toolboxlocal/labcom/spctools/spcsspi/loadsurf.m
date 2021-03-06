function [y,a,f] = loadsurf(name,ftype,smooth,L)
%LOADSURF Load surface generated by 'sxaf' SSPI program.
%       [Y,A,F] = LOADSURF('NAME') loads SSPI 'sxaf' program
%       generated surface from the file 'NAME'.  The '*.surf'
%       file format is discussed in section 4.12 of the SSPI
%       Cyclic Spectral Analysis Software Package.  LOADSURF
%       automatically detects between binary and ASCII surface
%       files.  Values outside the computed diamond are set to 
%       zero.
%
%       The output arguments are the MxN surface matrix, Y, a
%       Nx1 alpha scale vector, A, and a Mx1 frequency scale
%       vector, F.
%
%       Note: Binary *.surf files are not compatible across
%             platforms.
%
%       See also LOADSURF, SSPIPAM, SSPISXAF

%       Dennis W. Brown 7-17-93, DWB 1-21-94
%       Naval Postgraduate School, Monterey, CA
%       May be freely distributed.
%       Not for use in commercial products.

% default output
y = []; a = []; f = [];

% name must be a string
if ~isstr(name),
	error('loadsurf: Filename must be a string argument!');
end;

% open file as a binary, get first byte and close
fid = fopen(name,'rb');
if fid < 0,
    error(['loadsurf: Could not open ' name '...']);
else
    bite = fread(fid,1,'int8');
    fclose(fid);
end;

% figure out file storage type
if bite == 49 | bite == 50,

    % ASCII '1' or '2', must be ASCII
    bintype = 1;
    fid = fopen(name,'r');
    [type,count] = fscanf(fid,'%d',[1,1]);

elseif bite >= 0 & bite <= 2,

    % binary 1 or 2, muxt be binary (0 if on Sun)
    bintype = 2;
    fid = fopen(name,'rb');
    [type,count] = fread(fid,1,'int32');

else
	error(['loadsurf: Invalid SSPI format...']);
end

% check for correct file format once more
if type ~= 1 & type ~=2,
    fclose(fid);
    error('loadsurf: Invalid SSPI format...');
end;

% read number of cuts
if bintype == 1,
    [nbrcuts,count] = fscanf(fid,'%d',[1,1]);
else,
    [nbrcuts,count] = fread(fid,1,'int32');
end;

if count ~= 1,
    error('loadsurf: Error reading number of cuts...');
end;

% computer dependency
c = computer;
if strcmp(c(1:2),'PC'),
    ftype = 'float';
else
    ftype = 'float';
end;

% read alpha minimum
if bintype == 1,
    [alphamin,count] = fscanf(fid,'%f',[1,1]);
else,
    [alphamin,count] = fread(fid,1,ftype);
end;

if count ~= 1,
    error('loadsurf: Error reading minimum alpha...');
end;

% read alpha maximum
if bintype == 1,
    [alphamax,count] = fscanf(fid,'%f',[1,1]);
else,
    [alphamax,count] = fread(fid,1,ftype);
end;

if count ~= 1,
    error('loadsurf: Error reading maximum alpha...');
end;

% alpha scale
a = (alphamin:(alphamax-alphamin)/(nbrcuts-1):alphamax);

% read number of data points
if bintype == 1,
    [nbrdata,count] = fscanf(fid,'%d',[1,1]);
else,
    [nbrdata,count] = fread(fid,1,'int32');
end;

if count ~= 1,
    error('loadsurf: Error reading number of data points...');
end;

% read fmin_max
if bintype == 1,
    [fminmax,count] = fscanf(fid,'%f',[1,1]);
else,
    [fminmax,count] = fread(fid,1,ftype);
end;

if count ~= 1,
    error('loadsurf: Error reading fmin_max...');
end;

% read fmax_max
if bintype == 1,
    [fmaxmax,count] = fscanf(fid,'%f',[1,1]);
else,
    [fmaxmax,count] = fread(fid,1,ftype);
end;

if count ~= 1,
    error('loadsurf: Error reading fmax_max...');
end;

% frequency scale
f = (fminmax:(fmaxmax-fminmax)/(nbrdata-1):fmaxmax);

% allocate space for surface
y = ones(nbrcuts,nbrdata) * eps;

% read the samples
for k = 1:nbrcuts,
    if bintype == 1,
        [alpha1] = fscanf(fid,'%e',[1 1]);
        [numf1] = fscanf(fid,'%d',[1 1]);
        [fmin1] = fscanf(fid,'%e',[1 1]);
        [fmax1] = fscanf(fid,'%e',[1 1]);
        if type == 1,
            [x,count] = fscanf(fid,'%e',[1 numf1]);
            if isempty(x), x = 0; numf1 = 1; end;
            x = x(:);
        else,
            [x,count] = fscanf(fid,'%e %e',[2 numf1]);
            if isempty(x), x = [0;0]; numf1 = 1; end;
            x = x.';
            x = x(:,1) + j * x(:,2);
        end;
    else,
        [alpha1] = fread(fid,1,ftype);
        [numf1] = fread(fid,1,'int32');
        [fmin1] = fread(fid,1,ftype);
        [fmax1] = fread(fid,1,ftype);
        if numf1 == 0,
             x = 0;
             numf1 = 1;
        else,
            if type == 1,
                [x,count] = fread(fid,numf1,ftype);
                x = x(:);
            else,
                [x,count] = fread(fid,2*numf1,ftype);
                x = reshape(x,2,length(x)/2).';		% note transpose
                x = x(:,1) + j * x(:,2);
            end;
        end;
    end;
    start = floor((nbrdata - numf1)/2) + 1;
    y(k,start:start+numf1-1) = x.';
end;

% go ahead and close the file
fclose(fid);


