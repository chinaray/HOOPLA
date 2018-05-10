function [Result, Param] = ini_HydroMod13(Switches, Date, x)
%
% [Result, Param] = ini_HydroMod13(Switches, Date, x)
%
% PDM8 initialization, for details see associated PDM8.m file
%
% Programmed by G. Seiller, Univ. Laval (05-2013)
% Slightly modified by A. Thiboult (2016)

% Parameters
Param.x = x ;

% Routing delay consideration
drtfc = ceil( x(4) );
k = (0:drtfc)';
Param.DL = zeros( size(k) );
Param.DL(end-1) = 1/(x(4)-k(end-1)+1);
Param.DL(end) = 1-1/(x(4)-k(end-1)+1);
Param.HY  = zeros( size(Param.DL) );

% Initialization of the reservoir states
%
Param.S = x(1)*0.2;
Param.T = 20;
Param.M = 30;
Param.N = 30;

% Apply PDM
%
lP    = length( Date ) ;
Result.Qs    = zeros( lP,1 ) ;

if Switches.exportLight.on == 0
    % Flow components
    Result.inter = zeros( lP, 8 ) ;
    Result.interq = zeros( lP, 15 ) ;
end