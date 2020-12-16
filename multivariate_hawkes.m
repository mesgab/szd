%Multivariate Hawkes, két idegsejtre

lambda1 = 10;   % 1. sejt kezdõ intenzitás
lambda2 = 8;    % 2. sejt kezdõ intenzitás
nu = 2;         % background intenzitás
a = 3.4;        % decay
b = 2;          % ugrás nagysága
T = 100;        % eddig történik a 'mérés'

n = 144*T; %increments
[lambdavect1,lambdavect2] = homokozo(lambda1, lambda2, nu, a, b, T, n);

%str1 = sprintf('ugrások száma: N = %g', N);  %N kimutatása
figure(1);
hold on 
plot(linspace(0, T, n), lambdavect1,  'c')
plot(linspace(0, T, n), lambdavect2,  'b') %kitörölni, ha két figure
grid on
title('Intenzitás függvény')
%legend(str1)
xlabel('t','fontsize',14)
ylabel('\lambda_t','fontsize',14);
hold off

%str2 = sprintf('ugrások száma: N = %g',  N);
% figure(2);
% hold on 
% plot(linspace(0, T, n), lambdavect2,  'b')
% grid on
% title('Intenzitás függvény')
% %legend(str2)
% xlabel('t','fontsize',14)
% ylabel('\lambda_2','fontsize',14);
% hold off


