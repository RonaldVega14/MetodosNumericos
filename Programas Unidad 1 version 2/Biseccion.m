%M�todo de Bisecci�n - Tipo gui�n 
%f(x)=0
clc
clear all %#ok<CLALL> (Matlab lo puso)
disp('M�todo de Bisecci�n')
disp(' ')
syms x
f=input('Introduzca la funci�n f: ');
a=input('Introduzca el l�mite inferior a: ');
b=input('Introduzca el l�mite superior b: ');
error=input('Introduzca el valor de la presici�n deseada: ');
fa=subs(f,a);
fb=subs(f,b);
if (fa*fb)<0
    p=(a+b)/2;
    fp=subs(f,p);
    cont=1;
    tol=abs(fp);
    disp('  n           a                   b                   p             Error')
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %e\n',cont,a,b,p,tol)
    while abs(p-a)>error %Condici�n para detener la corrida comparando el error.
        cont=cont+1;
        if (fa*fp)<0 %Comprobando el cambio de signo
            a=a; %#ok<ASGSL> (Matlab lo puso)
            b=p;
            p=(a+b)/2;
            tol=abs(p-b);
        else
            a=p;
            b=b; %#ok<ASGSL> (Matlab lo puso)
            p=(a+b)/2;
            tol=abs(p-a);
            
        end
        fp=subs(f,p);
        fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %e\n',cont,a,b,p,tol)
    end
end
disp (' ')
fprintf('EL valor de x aproximadamente es: %9.15f\n',p)        