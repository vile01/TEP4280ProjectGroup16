% Calculations for GCI
clear all
close all
clc

% Test with the data from the article:
Xh=[5.863 5.972 6.063];
h=sqrt([1/4500 1/8000 1/18000]);
r=[1.333 1.5];

a=(Xh(2)-Xh(1))/(Xh(3)-Xh(2));
s=sign(a);
rf=r(2);
rc=r(1);
f=@(x)x-abs(log(abs(a))+log((rf^x-s)/(rc^x-s)))/log(rf);
p=fzero(f,1)
fi_ext_coarse=(rc^p*Xh(2)-Xh(1))/(rc^p-1)
fi_ext=(rf^p*Xh(3)-Xh(2))/(rf^p-1)
e_a=abs((Xh(3)-Xh(2))/Xh(3))
e_ext=abs((fi_ext-Xh(3))/fi_ext)
GCI=1.25*e_a/(rf^p-1)

