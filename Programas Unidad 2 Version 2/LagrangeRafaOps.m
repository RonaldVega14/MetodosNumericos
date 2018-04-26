%M�todo de Lagrange - Tipo gui�n
clear all %#ok<CLALL> (Matlab lo puso)
clc
disp('M�todo de Lagrange con opciones');
disp(' ');
z=input('Introduzca el valor de x a aproximar: ');
n=input('�Cu�ntos valores de X desea ingresar?: ');
for i=0:(n-1)
   fprintf ('  x%0.0f : ',i);
   vecx(i+1)=input (''); %#ok<*SAGROW> (Matlab lo puso)
end
fprintf('�Qu� desea hacer:\n1.Agregar los valores de F(x).\n2.Introducir una funci�n F(x).\nR/')
op=input('');
if (op==1)%Si se van a ingresar los valores de F(x)%
    
    for i=0:(n-1)
        fprintf ('  F(x%0.0f) : ',i);
        vecy(i+1)=input ('');
    end
    
    for i=1:n
        num=1;
        den=1;
        fprintf('L%d = ',i-1);
        for j=1:(n)
            if(j==i)
            %no pasa nada cuando J=I%
            else
            num=num*(z-vecx(j));
            den=den*(vecx(i)-vecx(j));
            fprintf('[(x-x%1.0f)/(x%1.0f-x%1.0f)]',j-1,i-1,j-1);
            %pause;
            end
        end
        vecl(i)=num/den;
        fprintf(' = %9.15f\n',vecl(i));
    end
    p=0;
    fprintf('P: ');
    
    for i=1:n
        if i==n
            fprintf('(L%d*F(t%d))\n',i-1,i-1);
        else
            fprintf('(L%d*F(t%d)) + ',i-1,i-1);
        end
        p=p+(vecl(i)*vecy(i));
    end
    fprintf('El valor Aproximado es: %9.15f\n', p);
    
elseif (op==2)%Si se va a ingresar la funcion F(x)%
    syms x;
    f=input('Ingrese la funci�n F(x): ');
    fprintf('Los valores obtenidos de F(x) son:\n');
    
    for i=1:n
        vecy(i)=subs(f,vecx(i));
        fprintf('F(x%d)= %9.15f\n',i-1,vecy(i));
    end
    
    for i=1:n
        num=1;
        den=1;
        fprintf('L%d = ',i-1);
        for j=1:(n)
            if(j==i)
            %no pasa nada cuando J=I%
            else
            num=num*(z-vecx(j));
            den=den*(vecx(i)-vecx(j));
            fprintf('[(x-x%1.0f)/(x%1.0f-x%1.0f)]',j-1,i-1,j-1);
            %pause;
            end
        end
        vecl(i)=num/den;
        fprintf(' = %9.15f\n',vecl(i));
    end
    p=0;
    fprintf('P=');
    for i=1:n
        if i==n
            fprintf('(L%d*F(t%d))\n',i-1,i-1);
        else
            fprintf('(L%d*F(t%d)) + ',i-1,i-1);
        end
        p=p+(vecl(i)*vecy(i));
    end
    fprintf('El valor Real es: %9.15f\n', subs(f,z));
    fprintf('El valor Aproximado es: %9.15f\n', p);
    err=abs(subs(f,z)-p);
fprintf('Error: %e\n',err);
else
    fprintf('Debe ingresar una opci�n v�lida (1 � 2)');
end