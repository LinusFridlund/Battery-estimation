function [ocv, docv] = ocv_from_soc(soc, p)
%OCV_FROM_SOC Returns the ocv and its slope from the current SOC.
%   soc     State of charge between 0-1
%   p       Parameter struct with p.soc_pts and p.ocv_pts
%   ocv     [V]
%   docv    [V per unit SOC] Slope of the table segment the SOC lies in

n    = numel(p.ocv_pts);
step = p.soc_pts(2) - p.soc_pts(1);

% Clamp to 0-1
s = min(max(soc, p.soc_pts(1)), p.soc_pts(n));

% Which segment is the soc in?
k = floor((s - p.soc_pts(1)) / step) + 1;
k = min(k, n - 1); 

% Linear interpolation within that segment
v0 = p.ocv_pts(k);
v1 = p.ocv_pts(k + 1);
docv = (v1 - v0) / step;                   % slope of this segment
ocv  = v0 + docv * (s - p.soc_pts(k));

end

