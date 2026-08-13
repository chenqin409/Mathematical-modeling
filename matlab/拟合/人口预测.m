year = 1790:10:2000;
population = [3.9,5.3,7.2,9.6,12.9,17.1,23.2,31.4,38.6,50.2,62.9,76.0,92.0,106.5,123.2,131.7,150.7,179.3,204.0,226.5,251.4,281.4];
plot(year,population,'o')
[fitresult, gof] = createFit(year, population);
t = 2001:2030;
xm=342.44;
r=0.0274;
f=xm./(1+(xm/3.9-1).*exp(-r.*(t-1790)));
figure(2)
plot(year,population,'o',t,f,'-')