%% Data:
E = 210e9;        % Pa
I = 0.0002;       % m^4
L_total = 6;      % m
nElem = 2;
Le = L_total / nElem;   % each element length = 3 m

% Global DOFs: [w1 phi1 w2 phi2 w3 phi3]
nNode = nElem + 1;
nDOF  = 2 * nNode;

%% Defining Element Stiffness Matrix:
L = Le;
k_local = (E*I / L^3) * ...
    [ 12    6*L   -12    6*L;
      6*L  4*L^2  -6*L  2*L^2;
     -12   -6*L    12   -6*L;
      6*L  2*L^2  -6*L  4*L^2 ];

%% Assembling The Global Stiffness Matrix:
K = zeros(nDOF);

% Element 1: node 1–2  DOFs [1 2 3 4]
dofs_e1 = [1 2 3 4];
K(dofs_e1,dofs_e1) = K(dofs_e1,dofs_e1) + k_local;

% Element 2: node 2–3  DOFs [3 4 5 6]
dofs_e2 = [3 4 5 6];
K(dofs_e2,dofs_e2) = K(dofs_e2,dofs_e2) + k_local;

disp('Global stiffness matrix K:');
K  % this is for command window   

K_orig = K;   % save for further steps (calculating the reaction forces)

%% Force Vector
F = zeros(nDOF,1);
F_ext = F;      % keep a copy of external loads

F(5)    = -50e3;   % 50 kN downward at node 3 vertical DOF (w3)
F_ext(5)= -50e3;

%% Applying the Boundary Conditions
% Fixed at left end: w1 = 0, phi1 = 0
% Roller at middle: w2 = 0 (rotation pi2 free)
fixedDOF = [1 2 3];   % w1, phi1, w2

for i = fixedDOF
    K(i,:) = 0;
    K(:,i) = 0;
    K(i,i) = 1;
    F(i)   = 0;
end

%% Solving For Displacements
u = K \ F;   % [w1 phi1 w2 phi2 w3 phi]^T

disp('Nodal displacements & rotations (u):');
% show in mm and rad for readability
u_mm = u; 
u_mm([1 3 5]) = u([1 3 5])*1e3;  % convert w to mm (only vertical DOFs)
fprintf('w1 = %.4f mm, th1 = %.4e rad\n', u_mm(1), u(2));
fprintf('w2 = %.4f mm, th2 = %.4e rad\n', u_mm(3), u(4));
fprintf('w3 = %.4f mm, th3 = %.4e rad\n', u_mm(5), u(6));

%% --- Reactions at supports ---
R = K_orig * u - F_ext;   % reactions at all DOFs

disp('Reactions R (N) for DOFs [w1 phi1 w2 phi2 w3 phi3]:');
R

fprintf('\nSupport reactions:\n');
fprintf('At fixed end (node 1): V1 = %.2f N, M1 = %.2f N*m\n', R(1), R(2));
fprintf('At roller (node 2):   V2 = %.2f N\n', R(3));
