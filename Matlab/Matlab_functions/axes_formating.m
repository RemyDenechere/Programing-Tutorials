% Define a default value on the root level so that all subsequent plotting 
% functions use those defaults. 
% Specify the root in set and get statements using the groot function,
% which returns the handle to the root.
% Define default property values on three levels (Copy from matlab documentation):

% " Root — values apply to objects created in current MATLAB® session
% Figure — use for default values applied to children of the figure defining 
% the defaults.
% Axes — use for default values applied only to children of the axes defining 
% the defaults and only when using low-level functions (light, line, patch,
% rectangle, surface, text, and the low-level form of image)."

% Define a default property value using a character vector with these three parts:
%       'default' ObjectType PropertyName

%!!!! Line properties have to be defined at the roo level (groot) as plot
% is a high order function that takes input from figure or root level,
% axes are children from plot so defining properties from axes will not be
% used by plot 

%!!! This does not applie to gscatter functions. 

set(gfigure,... % Define default values at root level
    'DefaultLineLineWidth', 1.5, ...      % Line properties 
    'DefaultLineMarkerSize', 15, ...
    'DefaultLineMarker','O', ...
    'DefaultAxesFontSize', 11,...     % Axes properties 
    'DefaultAxesTitleHorizontalAlignment', 'center', ...
    'DefaultAxesXScale', 'linear',...
    'DefaultAxesYScale', 'linear', ...
    'DefaultAxesBox', 'on')
% , ...         % Tiledlayout formating
%     'DefaultLineTiledChartLayoutTileSpacing', 'compact', ...
%     'DefaultLineTiledChartLayoutPadding', 'compact')

