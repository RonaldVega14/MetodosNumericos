%Método de Diferencias Dividas - ambas opciones - Tipo guión
clear all %#ok<CLALL> %(Matlab lo puso)
clc
syms x
disp('Método de Diferencias Divididas')
disp(' ');
val=input('Introduzca el valor de x a aproximar: ');
dato=input('Introducir los datos [X0 X1 X2 ... Xn](Ponerlos entre corchetes y separados por comas): ');
t=length(dato);
fprintf('Seleccione una opción: \n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f=input('Introducir la función f(x): ');
        fun=zeros(1,t);
        for i=1:t
            fun(i)=subs(f,dato(i));
            fprintf('%9.15f, ', double(fun(i)));
        end
    case 2
        fun=input('Introduzca los valores F(x) [F(X0) F(X1) ... F(Xn)(ponerlos entre corchetes y separados por comas]: ');
end
DD=zeros(t);
format long e
fprintf('\nObteniendo las diferencias divididas:');
DD(:,1)=fun';
%for i=1:t
%    DD(i,1)=fun(i);
%end
for j=2:t
    fprintf('\n - Columna %2.0f de diferencias divididas\n',double(j));
    for i=j:t
        DD(i,j)=(DD(i,j-1)-DD(i-1,j-1))/(dato(i)-dato(i-j+1));
        fprintf('(%9.15f-(%9.15f))/(%9.15f-(%9.15f)) = %9.15f\n',double(DD(i,j-1)),double(DD(i-1,j-1)),double(dato(i)),double(dato(i-j+1)),double(DD(i,j)));
    end
end
DD %#ok<NOPTS>
fprintf('\nPolinomio grado %1.0f\n',double(t-1));
pol=DD(1,1);
fprintf('P%1.0f(x)= A0 + ',double(t-1));
for i=2:t
    fprintf('A%1.0f',i-1);
    for j=1:i
        fprintf('(x-x%1.0f)',j-1);
    end
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(x)= %8.15f + ',double(t-1),double(DD(1,1)));
for i=2:t
    factor=DD(i,i);
    fprintf('(%9.15f)*',double(DD(i,i)));
    for j=1:i-1
        fprintf('(x-(%9.15f))',double(dato(j)));
        factor=factor*(val-dato(j));
    end
    pol=pol+factor;
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(%9.15f)= %9.15f\n\n',double(t-1),double(val),double(pol));
if opc==1
    fprintf('Valor Exacto de la Función: %9.15f',double(subs(f,val)));
    fprintf('\nError: %e\n\n',double(abs(pol-subs(f,val))));
end