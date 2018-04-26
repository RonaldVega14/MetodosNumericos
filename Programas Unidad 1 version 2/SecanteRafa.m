%Método de la Secante - Tipo guión 
%f(x)=0
clc
clear all %#ok<CLALL> (Matlab lo puso)
disp('Método de la Secante')
disp(' ')
syms x
f=input('Introduzca la función f(x): ');
P0=input('Introduzca el valor de P0: ');
P1=input('Introduzca el valor de P1: ');
error=input('Introduzca el valor de la presición deseada: ');
P2=P1-[(subs(f,P1))*(P1-P0)]/[subs(f,P1)-(subs(f,P0))]; %#ok<NBRAK> (Matlab lo puso)
tol=abs(P2-P1);
cont=1;
disp(' n         P0                 P1                P2               error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %e\n',double(cont),double(P0),double(P1),double(P2),double(tol))
while tol>error
    cont=cont+1;
    P0=P1;
    P1=P2;
    P2=P1-[(subs(f,P1))*(P1-P0)]/[subs(f,P1)-(subs(f,P0))]; %#ok<NBRAK> (Matlab lo puso)
    tol=abs(P2-P1);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %e\n',double(cont),double(P0),double(P1),double(P2),double(tol))
end
disp (' ')
fprintf('EL valor de P2 aproximadamente es: %9.15f\n',double(P2))