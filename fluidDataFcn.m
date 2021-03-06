function fluidData = fluidDataFcn(LiquidName,angle)
%
%   function fluidData = fluidDataFcn(LiquidName,angle)
%
% database function which returns fluidData for selected liquid type
%
% INPUT variable
% LiquidName    ... name of the liquid used for the experiment
% angle         ... plate inclination angle (for calculation of g)
%
% OUTPUT variable
% fluidData     ... necessary data for the rivulet processing
%                   [gx gz sigma rho eta reg]
%   - gx        ... gravitational acceleration for plate inclination angle,
%                   m/s^2, against the plate, only size, NOT direction
%   - gz        ... gravitational acceleration for plate inclination angle,
%                   m/s^2, along the plate
%   - sigma     ... surface tension of the liquid, N/m
%   - rho       ... density of the liquid, kg/m^3
%   - eta       ... dynymic viscozity of the liquid, Pas
%   - reg       ... vector with polynomial coefficients for the rotameter
%                   calibration: reg(1)x^n + reg(2)x^(n-1) ... reg(n+1)
%
% Author:       Martin Isoz
% Organisation: ICT Prague / TU Bergakademie Freiberg
% Date:         30. 07. 2012
%
% License: This code is published under MIT License, please do not abuse
% it.
%
% See also: RIVULETEXPDATAPROCESSING RIVULETPROCESSING

gz   = sin(angle/180*pi)*9.81;                                              %along the plate, plate incl. angle conv deg -> rad
gx   = cos(angle/180*pi)*9.81;                                              %against the plate, !! axis notation !!

switch LiquidName
    case '???'                                                              %liquid used for testing of the program, different than the others
        sigma   = 0.0202;
        rho     = 930;
        eta     = 0.0093;
        reg     = [0.00268867271984935...
                   0.0165546451606565...
                   0.0738965243420832];
    case 'DC 5'
        sigma   = 17.57e-3;
        rho     = 920;
        eta     = 5.073e-3;
%         reg     = [0.00268867271984935...                                   %calibration, Andre Marek
%                    0.0165546451606565...
%                    0.0738965243420832];
        reg     = [0.0049986225273888 ...                                   %calibration, Martin Isoz
                   0.0163080625029897...
                   0.222059315865721];
    case 'DC 10'
        sigma   = 17.89e-3;
        rho     = 940;
        eta     = 10.419e-3;
        reg     = [0.00164145658263305...                                   %calibration, Martin Isoz
                   0.0537997623291741...
                   0.109861217214158];
    case 'Water'
        sigma   = 55.18e-3;
        rho     = 998;
        eta     = 1.178e-3;
        reg     = [0.274879879879880...                                     %calibration, Martin Isoz
                   0.271921921921918];
    case 'Tenzids'
        sigma   = 29.36e-3;
        rho     = 998;
        eta     = 1.114e-3;
        reg     = [0.274879879879880...                                     %calibration, Martin Isoz
                   0.271921921921918];
end

fluidData = [gx gz sigma rho eta reg];