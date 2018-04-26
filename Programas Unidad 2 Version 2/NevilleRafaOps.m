%Método de Neville - Tipo guión
clear all %#ok<CLALL> (Matlab lo puso)
clc
syms x
disp('Método de Neville')
disp(' ');
val=input('Introduzca el valor de x a aproximar: ');
dato=input('Datos [X0 X1 X2 ... Xn] - (Introducir datos separados por comas, entre corchetes) - : ');
t=length(dato);
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
disp(' ');
opc=input('Seleccione una opción: ');
disp(' ');
switch opc
    case 1
        f=input('Introduzca la F(x): ');
        p=zeros(1,t);
        
        for i=1:t
            p(i)=subs(f,dato(i));
        end
        
    case 2
        p=input('Introduzca los valores iniciales [F(X0) F(X1) ... F(Xn) - (Introducir valores separados por comas) - ]: ');
end
Q=zeros(t);
format long e
for i=1:t
    Q(i,1)=p(i);
    fprintf('\nQ(%1.0f,0) = %9.15f', i-1,p(i));
end
for i=2:t
    for j=2:i
        Q(i,j)=(((val-dato(i-j+1))*Q(i,j-1))-((val-dato(i))*Q(i-1,j-1)))/(dato(i)-dato(i-j+1));
        fprintf('\n\t   (X-X%1.0f)Q%1.0f%1.0f -(X-X%1.0f)Q%1.0f%1.0f     (x-(%3.2f))*(%3.15f) - (x-(%3.2f))*(%3.15f) ',i-j,i-1,j-2,i-1,i-2,j-2,dato(i-j+1),Q(i,j-1),dato(i),Q(i-1,j-1))
        fprintf('\nQ(%1.0f,%1.0f)= --------------------  =  --------------------------------------------------------------- = %9.15f', i-1, j-1, Q(i,j));
        fprintf('\n\t\t\t  (X%1.0f-X%1.0f)\t\t\t\t\t\t\t\t     (%3.3f)-(%3.3f)\n',i-1,i-j,dato(i),dato(i-j+1));
    end
end
fprintf('\n\nValor Aproximado: %9.15f\n',Q(t,t));
if opc==1
    fprintf('\nValor Exacto de la Función: %9.15f',subs(f,val));
    fprintf('\nError: %e\n\n',abs(Q(t,t)-subs(f,val)));
else
    fprintf('\nError: %e\n\n',abs(Q(t-1,t-1)-Q(t,t)));
end
disp('Preguntar si quiere la matriz triangular "bonita"');
disp('Si quiere la matriz bonita ármela con los valores de Q(filas,columas) empezando de cero en fila y columna, ordenándolas y poniendo ceros donde no haya valor');