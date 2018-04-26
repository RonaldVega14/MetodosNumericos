%Método de Punto Fijo - Tipo guión 
%g(x)=x
clc
clear all %#ok<CLALL> (Matlab lo puso)
disp('Método de Punto Fijo');
disp(' ')
syms x
g=input('Introduzca la función G(x): ');
Po=input('Introduzca el punto inicial: '); %Este punto debe estar dentro del intervalo dado
error=input('Introduzca el valor de la presición deseada: ');
P=subs(g,Po);
tol=abs(P-Po);
cont=1;
disp(' n          Po                P                error')
fprintf('%2.0f  %9.15f  %9.15f  %e\n',cont,Po,P,tol)
while tol>error
    cont=cont+1;
    Po=P;
    P=subs(g,Po);
    tol=abs(P-Po);
    fprintf('%2.0f  %9.15f  %9.15f  %e\n',cont,Po,P,tol)
end
disp (' ')
fprintf('EL valor de x aproximadamente es: %9.15f\n',P)