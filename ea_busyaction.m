function ea_busyaction(varargin)
% function displays or hides a spinning wheel on top right corner (default)
% of figure.


onoff=varargin{1};
fighandle=varargin{2};

if nargin>2
    pos=varargin{3};
else
    sz=get(fighandle,'Position');
    pos=[sz(3)-80-10 sz(4)-10-80 50 50];
end

if ischar(pos)
    switch pos
        case 'lead'
            sz=get(fighandle,'Position');
            pos=[sz(3)-50-2 sz(4)-50-2 50 50]; 
            onfigtit='Welcome to LEAD-DBS (busy...)';
            offfigtit='Welcome to LEAD-DBS';
        case 'acpc'
            sz=get(fighandle,'Position');
            pos=[sz(3)-50-2 sz(4)-50-2 50 50]; 
            onfigtit='ACPC/MNI-space conversions (busy...)';
            offfigtit='ACPC/MNI-space conversions';
        case 'group'
            sz=get(fighandle,'Position');
            pos=[sz(3)-50-10 sz(4)-10-50 50 50];
            onfigtit='LEAD-DBS Group Analysis (busy...)';
            offfigtit='LEAD-DBS Group Analysis';
    end
end

switch onoff
    case 'on'
        if ~exist('onfigtit','var')
        figtit=get(fighandle,'Name');
        set(fighandle,'name',[figtit,' (busy...)']);
        else
            set(fighandle,'name',onfigtit);
        end
        
        spinner=getappdata(fighandle,'spinner');
        %%if isempty(spinner)
            try
                % R2010a and newer
                iconsClassName = 'com.mathworks.widgets.BusyAffordance$AffordanceSize';
                iconsSizeEnums = javaMethod('values',iconsClassName);
                SIZE_32x32 = iconsSizeEnums(2);  % (1) = 16x16,  (2) = 32x32
                spinner = com.mathworks.widgets.BusyAffordance(SIZE_32x32, 'Busy');  % icon, label
            catch
                % R2009b and earlier
                redColor   = java.awt.Color(1,0,0);
                blackColor = java.awt.Color(0,0,0);
                spinner = com.mathworks.widgets.BusyAffordance(redColor, blackColor);
            end
            spinner.getComponent.setBackground(java.awt.Color(1, 1, 1)); 
            spinner.setPaintsWhenStopped(true);  % default = false
            spinner.useWhiteDots(false);         % default = false (true is good for dark backgrounds)
        %end
        javacomponent(spinner.getComponent, pos, fighandle);
        spinner.start;
        
        setappdata(fighandle,'spinner',spinner);
        % change mousewheel, too:
        
        set(fighandle, 'pointer', 'watch')
        drawnow;
        
    case 'off'
        
        if ~exist('offfigtit','var')
            figtit=get(fighandle,'Name');
            set(fighandle,'name',figtit(1:end-10));
        else
            set(fighandle,'name',offfigtit);
        end
        
        spinner=getappdata(fighandle,'spinner');
        spinner.stop;
        spinner.setBusyText('Idle');
        %spinner.getComponent.setVisible(false);
        
        % change mouswheel, too:
        set(fighandle, 'pointer', 'arrow');
end