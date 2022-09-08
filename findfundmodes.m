function varargout=findfundmodes(mlabel,tdata)
% [modes,freqs]=findfundmodes(mlabel,tdata)
%
% Retrieves the fundamental modes (e.g. n=0).
%
% Input:
%
% mlabel   String array with the labels to the corresponding mode frequency
% tdata    Data table containing the observed modes, their uncertainity, and the prem computed
%          modes
%
% Output:
%
% modes    String array of fundamental mode names
% freqs    Data table of fundamental modes (format: [observed modes, their uncertainity, prem computed modes])
%
% Note: 
%
% Requires textfile masterswidmer.
%
% Last modified by pdabney@princeton.edu, 09/07/22


% Find the fundamental modes
index = [];
for i = 1:length(mlabel)
    modename=char(mlabel(i));
    if strcmp(modename(1),'0')
        index = [index; i];
    end
end

modes=mlabel(index);
freqs=tdata(index,:);

% optional output
vars={modes,freqs};
varargout=vars(1:nargout);

end