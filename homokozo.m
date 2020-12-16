function [lambdavect1, lambdavect2] = homokozo(lambda1, lambda2, nu, a, b, T, n)

%% [emlékeztetõ! (ezeket adom multivariate_hawkesból)]:
% nu, alpha, T, n   választott számok      
% lambda1,lamdba2   
% 
% két vektorra szedem az eredményt, mert könnyebben kezelem
% lambdavect1,lamdbavect2 adja a két idegsejt intenzitás függvényét
% N  az ugrásokat


lambdavect1(1,:) = lambda1;
lambdavect2(1,:) = lambda2;

%%ellenõrzés a próbálgatásokhoz%%
if lambda1<=nu || lambda1<=nu || a<=b
    error('nézd át a paramétereidet!') 
    %backgroundnál induló lambdák nagyobbak, decay legyen nagyobb az ugrásnál
end

if n<0 || T<0
    error('lépés és idõ POZITÍV') 
end

% elõkészítés
%lambda = zeros(n, 1);
dt = T/n;
U = rand(n,1);
dNt = zeros(n, 1); %ugrások lesznek

% intenzitásfüggvény
for i=2:n
    
    %érmedobás szimuláció
    penzerme = rand;
    p1 =lambdavect1(i-1)/(lambdavect1(i-1)+lambdavect2(i-1));
    p2 =lambdavect2(i-1)/(lambdavect1(i-1)+lambdavect2(i-1)); %lambdák valségei
    
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
%N=sum(dNt); %N-t megadni outputnak, ha erre is kíváncsi vagyok

end