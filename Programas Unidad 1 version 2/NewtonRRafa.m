%Método de Newton Raphson - Tipo guión
%f(x)=0
clc
clear all %#ok<CLALL> (Matlab lo puso)
disp('Método de Newton Raphson')
disp(' ')
syms x
Xo=input('Introduzca el valor incial Xo: ');
f=input('Introduzca la función F: ');
error=input('Introduzca el valor de la presición deseada: ');
fXo=subs(f,Xo); %Función ya evaluada
dfXo=subs(diff(f,x),Xo); %Derivada ya evaluada
Xn=Xo-fXo/dfXo;
cont=1;
tol=abs(Xn-Xo);
disp(' n        Xo             Xn             Error')
fprintf('%2.0f  %9.15f  %9.15f  %e\n',double(cont),double(Xo),double(Xn),double(tol))
while tol>error
    cont=cont+1;
    Xo=Xn;
    fXo=subs(f,Xo);
    dfXo=subs(diff(f,x),Xo); 
    Xn=Xo-fXo/dfXo;
    tol=abs(Xn-Xo);
    fprintf('%2.0f  %9.15f  %9.15f  %e\n',double(cont),double(Xo),double(Xn),double(tol))
end
disp (' ')
fprintf('EL valor de x aproximadamente es: %9.15f\n',double(Xn))