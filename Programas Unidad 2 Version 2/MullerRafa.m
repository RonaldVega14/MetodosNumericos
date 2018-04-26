%Método de Müller - Tipo guión
%Pide tres valores, variante de la secante
clear all %#ok<CLALL> (Matlab lo puso)
clc
disp('Método de Müller');
disp(' ');
syms x
f= input('Introduzca la función P(x): ');
X0= input('Introduzca el primer valor: ');
X1= input('Introduzca el segundo valor: ');
X2= input('Introduzca el tercer valor: ');
error= input('Introduzca el valor de precisión deseada: ');
cont=1;
fxo=subs(f,X0);
fx1=subs(f,X1);
fx2=subs(f,X2);
c=fx2;
b=(((X0-X2)^2*(fx1-fx2))-((X1-X2)^2*(fxo-fx2)))/((X0-X2)*(X1-X2)*(X0-X1));
a=(((X1-X2)*(fxo-fx2))-((X0-X2)*(fx1-fx2))/(X0-X2)*(X1-X2)*(X0-X1));
x3=X2-((2*c)/(b+sign(b)*(sqrt(b^2-4*a*c))));
tol=abs(x3-X2);
disp('  n              xo                 x1                x2                  x3                   A                    B                   C              error')
fprintf('%3.0f %9.15f %9.15f %9.15f %9.15f %9.15f %9.15f %9.15f %e\n',cont,X0,X1,X2,x3,a,b,c,tol)
while tol>error
    cont=cont+1;
    X0=X1;
    X1=X2;
    X2=x3;
    fxo=subs(f,X0);
    fx1=subs(f,X1);
    fx2=subs(f,X2);
    c=fx2;
    b=(((X0-X2)^2*(fx1-fx2))-((X1-X2)^2*(fxo-fx2)))/((X0-X2)*(X1-X2)*(X0-X1));
    a=(((X1-X2)*(fxo-fx2))-((X0-X2)*(fx1-fx2))/(X0-X2)*(X1-X2)*(X0-X1));
    x3=X2-((2*c)/(b+sign(b)*(sqrt(b^2-4*a*c))));
    tol=abs(x3-X2);
    fprintf('%3.0f %9.15f %9.15f %9.15f %9.15f %9.15f %9.15f %9.15f %e\n',cont,X0,X1,X2,x3,a,b,c,tol)
end
fprintf('El valor aproximado de x3 es:%3.15f',x3);