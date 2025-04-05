quanser_aero_parameters;

%% State-Space Representation
A = [ 0           1            0            0;
     -Ksp/Jp    -Dp/Jp         0            0;
      0         0             0            1;
      0         0             0         -Dy/Jy];

B = [ 0              0;
      Kpp/Jp     Kpy/Jp;
      0              0;
      Kyp/Jy     Kyy/Jy];

C = [ 1  0  0  0;
      0  0  1  0];

D = zeros(2,2);


Ampc = [];
Bmpc = [];