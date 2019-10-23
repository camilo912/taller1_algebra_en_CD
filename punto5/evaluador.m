clear
clc
J_0 = 0;
c_0 = 0;
J_1 = 0;
c_1 = 0;
J_2 = 0;
c_2 = 0;
n = 1000;
for i=1:n
    [~, ~, J, c] = punto5(3, 15, 0, false, true);
    J_0 = J_0 + J(15);
    c_0 = c_0 + c;
    [~, ~, J, c] = punto5(3, 15, 1, false, true);
    J_1 = J_1 + J(15);
    c_1 = c_1 + c;
    [~, ~, J,c ] = punto5(3, 15, 2, false, true);
    J_2 = J_2 + J(15);
    c_2 = c_2 + c;
end
J_0 = J_0/n;
J_1 = J_1/n;
J_2 = J_2/n;
c_0 = c_0/n;
c_1 = c_1/n;
c_2 = c_2/n;