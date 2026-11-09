function p = cell_params_p50b(Np)
% Returns static cell parameters for a 2-RC model with Np cells in
% paralell for cell type Molicel INR-P50B

    % Cell-level parameters
    Q_cell_Ah = 5.0;          % [Ah]
    R0_cell   = 8.24e-3;      % [Ohm]
    R1_cell   = 18.75e-3;     % [Ohm]
    tau       = 113.9;        % [s]

% OCV Table
    soc_pts = 0:0.025:1;
    ocv_pts = [2.5358 2.6501 2.7919 2.8897 2.9720 3.0543 3.1227 3.1785 ...
               3.2279 3.2742 3.3205 3.3670 3.4106 3.4501 3.4865 3.5249 ...
               3.5585 3.5815 3.6139 3.6523 3.6895 3.7221 3.7539 3.7794 ...
               3.8027 3.8242 3.8444 3.8639 3.8850 3.9113 3.9419 3.9734 ...
               4.0045 4.0332 4.0563 4.0725 4.0831 4.0933 4.1084 4.1366 ...
               4.1932];

% Model parameters for Np cells in paralell
    p.name      = sprintf('Molicel P50B, %dP', Np);
    p.Np        = Np;
    p.Q_Ah      = Q_cell_Ah * Np;       % [Ah]
    p.Q         = p.Q_Ah * 3600;        % [As]
    p.eta       = 1.0;                  % coulombic efficiency [-]
    p.R0        = R0_cell / Np;         % [Ohm]
    p.R1        = R1_cell / Np;         % [Ohm]
    p.tau       = tau;                  % [s]
    p.C1        = p.tau / p.R1;         % [F]
    p.soc_pts   = soc_pts;
    p.ocv_pts   = ocv_pts;
    p.hyst      = 0;                    % [V] OCV hysteresis 
    p.V_min     = 2.5;                  % [V] cell voltage limits
    p.V_max     = 4.2;                  % [V] cell voltage limits
end

