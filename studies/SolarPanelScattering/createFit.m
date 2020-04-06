function [fitresult, gof] = createFit(angle, knockdown)
%CREATEFIT(ANGLE,KNOCKDOWN)
%  Create a fit.
%
%  Data for 'fit' fit:
%      X Input : angle
%      Y Output: knockdown
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 20-Feb-2020 01:41:09


%% Fit: 'fit'.
[xData, yData] = prepareCurveData( angle, knockdown );

% Set up fittype and options.
ft = fittype( 'c0 + c4*x + exp(c1*(tan(x)+c2*x))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.241691285913833 -0.0446 0.1 0.0964545251683886];
opts.Upper = [Inf 0 Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'fit' );
h = plot( fitresult, xData, yData );
legend( h, 'knockdown vs. angle', 'fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'angle', 'Interpreter', 'none' );
ylabel( 'knockdown', 'Interpreter', 'none' );
grid on


