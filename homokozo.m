function [lambdavect1, lambdavect2] = homokozo(lambda1, lambda2, nu, a, b, T, n)

%% [eml�keztet�! (ezeket adom multivariate_hawkesb�l)]:
% nu, alpha, T, n   v�lasztott sz�mok      
% lambda1,lamdba2   
% 
% k�t vektorra szedem az eredm�nyt, mert k�nnyebben kezelem
% lambdavect1,lamdbavect2 adja a k�t idegsejt intenzit�s f�ggv�ny�t
% N  az ugr�sokat


lambdavect1(1,:) = lambda1;
lambdavect2(1,:) = lambda2;

%%ellen�rz�s a pr�b�lgat�sokhoz%%
if lambda1<=nu || lambda1<=nu || a<=b
    error('n�zd �t a param�tereidet!') 
    %backgroundn�l indul� lambd�k nagyobbak, decay legyen nagyobb az ugr�sn�l
end

if n<0 || T<0
    error('l�p�s �s id� POZIT�V') 
end

% el�k�sz�t�s
%lambda = zeros(n, 1);
dt = T/n;
U = rand(n,1);
dNt = zeros(n, 1); %ugr�sok lesznek

% intenzit�sf�ggv�ny
for i=2:n
    
    %�rmedob�s szimul�ci�
    penzerme = rand;
    p1 =lambdavect1(i-1)/(lambdavect1(i-1)+lambdavect2(i-1));
    p2 =lambdavect2(i-1)/(lambdavect1(i-1)+lambdavect2(i-1)); %lambd�k vals�gei
    
    if abs(penzerme - p1) < abs(penzerme - p2)
        dNt(i) = (U(i) < lambdavect1(i-1)*dt);
        dlambda = a*(nu - lambdavect1(i-1))*dt + dNt(i).*b;
        lambdavect1(i) = lambdavect1(i-1) + dlambda;
        lambdavect2(i) = lambdavect2(i-1);
    else
        dNt(i) = (U(i) <= lambdavect2(i-1)*dt);
        dlambda = a*(nu - lambdavect2(i-1))*dt + dNt(i).*b;
        lambdavect1(i) = lambdavect1(i-1);
        lambdavect2(i) = lambdavect2(i-1) + dlambda;
    end
   
end
%N=sum(dNt); %N-t megadni outputnak, ha erre is k�v�ncsi vagyok

end