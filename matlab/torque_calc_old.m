l_u = 0.4/2;
l_l = 0.35/2;
F_g = (70 * 9.81)/2;

[theta_h, theta_k] = meshgrid(0:135, 0:90);
M_h = sind(theta_h) * l_u * F_g - sind(theta_k) * l_l * F_g;
M_k = sind(theta_k) * l_l * F_g;

figure(1);
surf(theta_h, theta_k, M_h)
xlabel('theta_h')
ylabel('theta_k')

figure(2);
surf(theta_h, theta_k, M_k)
xlabel('theta_h')
ylabel('theta_k')
