function [varargout]=plt_error(datatable,yrange,scale,gcf)
% [p] = plt_error(datatable,yrange,scale,gcf) 
%
% Adds mode locations with a scaled error to existing figure
%
% Input:
%
% datatable   Table containing mode frequencies and error (format: [observed error prem])
% yrange      Y-axis limit range, increasing order (format: [f1 f2])
% scale       Scale factor for error (default: 35)
% gcf         Figure to add modes
%
% Output:
%
% p           plot properties for legend
%
% Last modified by pdabney@princeton.edu, 9/19/22

% default
defval('scale',35)

% Extract data
err = datatable(:,2)*scale;
obs_modes = datatable(:,1);

% Add to existing plot
gcf
hold on;
% plot modes
for i = 1:length(obs_modes)
    vertexes = [(obs_modes(i)-err(i)) yrange(1); (obs_modes(i)-err(i)) yrange(2); (obs_modes(i)+err(i)) yrange(2); (obs_modes(i)+err(i)) yrange(1)];
    p=patch(vertexes(:,1),vertexes(:,2),[1 0 0],'FaceAlpha',0.4,'EdgeColor','none');
end



% Optional output
vars={p};
varargout=vars(1:nargout);

end
