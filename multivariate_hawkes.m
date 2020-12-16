%Multivariate Hawkes, k�t idegsejtre

lambda1 = 10;   % 1. sejt kezd� intenzit�s
lambda2 = 8;    % 2. sejt kezd� intenzit�s
nu = 2;         % background intenzit�s
a = 3.4;        % decay
b = 2;          % ugr�s nagys�ga
T = 100;        % eddig t�rt�nik a 'm�r�s'

n = 144*T; %increments
[lambdavect1,lambdavect2] = homokozo(lambda1, lambda2, nu, a, b, T, n);

%str1 = sprintf('ugr�sok sz�ma: N = %g', N);  %N kimutat�sa
figure(1);
hold on 
plot(linspace(0, T, n), lambdavect1,  'c')
plot(linspace(0, T, n), lambdavect2,  'b') %kit�r�lni, ha k�t figure
grid on
title('Intenzit�s f�ggv�ny')
%legend(str1)
xlabel('t','fontsize',14)
ylabel('\lambda_t','fontsize',14);
hold off

%str2 = sprintf('ugr�sok sz�ma: N = %g',  N);
% figure(2);
% hold on 
% plot(linspace(0, T, n), lambdavect2,  'b')
% grid on
% title('Intenzit�s f�ggv�ny')
% %legend(str2)
% xlabel('t','fontsize',14)
% ylabel('\lambda_2','fontsize',14);
% hold off


