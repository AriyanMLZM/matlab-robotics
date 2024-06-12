% Forward Kinematics of 2R Robot

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

q1 = 30 * pi/180;
q2 = 45 * pi/180;

PE_0 = subs(PE_0);
PE_0 = eval(PE_0)
