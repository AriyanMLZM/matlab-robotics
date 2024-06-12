% Solve Velocity of 2R Robot

clc;
clear;

l1 = 0.15;
l2 = 0.25;

syms q1 q2;

al = [0; 0];
a = [0; l1];
d = [0; 0];
tet = [q1; q2];

for i = 1:2
    T(:, :, i) = [cos(tet(i)), -sin(tet(i)), 0, a(i) ...
        ; sin(tet(i))*cos(al(i)), cos(tet(i))*cos(al(i)), -sin(al(i)), -sin(al(i))*d(i) ...
        ; sin(tet(i))*sin(al(i)), cos(tet(i))*sin(al(i)), cos(al(i)), cos(al(i))*d(i) ...
        ; 0, 0, 0, 1];
end

T2_0 = T(:, :, 1)*T(:, :, 2);
T2_0 = simplify(T2_0);
PE_2 = [l2; 0; 0; 1];
PE_0 = T2_0 * PE_2;

q = [q1; q2];
JE = jacobian(PE_0, q);

q1 = 30 * pi/180;
q2 = 45 * pi/180;

JE = subs(JE);

qdot1 = 0.1;
qdot2 = 0.2;

qdots = [qdot1; qdot2];
VE_0 = JE * qdots;
VE_0 = eval(vpa(simplify(VE_0), 3))
