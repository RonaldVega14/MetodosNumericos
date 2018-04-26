%Método de Steffensen - Tipo guión
%g(x)=x
%Función igualada x y un intevérvalo, la derivada y la funcion deben estar en ese intervalo, como en punto fijo
clc
clear all %#ok<CLALL> (Matlab lo puso)
disp('Método de Steffensen')
disp(' ')
syms x
g=input('Introduzca la función g(x): ');
P0=input('Introduzca el valor de Po:');
error=input('Introduzca el valor de la presición deseada: ');
P1=subs(g,P0);
P2=subs(g,P1);
P=P0-(P1-P0)^2/(P2-2*P1+P0);
tol=abs(P-P0);
cont=1;
disp(' n         P0                 P1                P2               P                  error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f  %e\n',double(cont),double(P0),double(P1),double(P2),double(P),double(tol))
while tol>error
    cont=cont+1;
    P0=P;
    P1=subs(g,P0);
    P2=subs(g,P1);
    P=P0-(P1-P0)^2/(P2-2*P1+P0);
    tol=abs(P-P0);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f  %e\n',double(cont),double(P0),double(P1),double(P2),double(P),double(tol))
end
disp (' ')
fprintf('EL valor de P aproximadamente es: %9.15f\n',double(P))