function save_graph(fig, FileType, name, w, h)
% save_graph: 
% Input variables: 
%   1) fig: The fig to be saved
%   2) FileType: File extension for the output: "pdf", "jpeg", "png","eps",
%                "svg"! use "svg" to handle the figure with inkscape
%   3) name: figure name
%   4) w: width in cm 
%   5) h: height in cm
% See also PRINT
% Rémy Denéchère 4/12/2024
arguments 
    fig  = gcf() 
    FileType char {mustBeMember(["pdf", "jpeg", "png","eps", "svg"])} = "pdf"
    name
    w
    h
end 


FileType = ['-d', string(FileType)]; 

x0=0;
y0=0;
width=w;
height=h; 
set(fig, 'Units', 'centimeters', 'position',[x0,y0,width,height])
screenposition = get(gcf,'Position'); % get the figure size
set(fig, 'PaperUnits','centimeters',...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize', [screenposition(3:4)]); % make the print paper size fits the figure size
print(fig, '-painters', FileType , name) 
end