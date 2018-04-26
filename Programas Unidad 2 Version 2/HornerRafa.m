%Método de Horner
clear all %#ok<CLALL> (Matlab lo puso)
clc
disp('--Ceros de Polinomios--');
disp(' ');
disp ('Método de Horner');
disp(' ');
cant=input('Introduzca la cantidad de coeficientes: ');
div1=cell(3,cant);

for i=1:cant
    fprintf('Ingrese el coeficiente #%d',i)
    div1{1,i}=input(' : ');
end

xo=input('Ingrese el valor de inicio Xo: ');
error = input('Introduzca el valor de ´presición deseada: ');
disp(' ');
i=1;
while (i~=0)
    
    fprintf('Iteración número %d\n',i)
    for j=1:cant
        if j==1
            div1{2,j}=0;
            div1{3,j}=div1{1,1};
        else
            div1{2,j}=xo*div1{3,j-1};
            div1{3,j}=div1{1,j}+div1{2,j};
        end
    end
    
div1;
    
    bop=div1{3,cant};
    
    div2=cell(3,cant-1);
    
    for k=1:cant-1
        div2{1,k}=div1{3,k};
    end
    
    for j=1:cant-1
        if j==1
            div2{2,j}=0;
            div2{3,j}=div2{1,1};
        else
            div2{2,j}=xo*div2{3,j-1};
            div2{3,j}=div2{1,j}+div2{2,j};
        end
    end
div2;
    
    boq=div2{3,cant-1};
    x1=xo-(bop/boq);
    tol=abs(x1-xo);
    fprintf('Valor de bop: %9.15f\n',bop)
    fprintf('Valor de boq: %9.15f\n',boq)
    fprintf('Valor de X1: %9.15f\n',x1)
    fprintf('Valor de error: %e\n',tol)
    format long; 
    cell(div1)
    cell(div2)
    disp(' ');
    i=i+1;
    if tol<error
    i=0;
    else
        xo=x1;
    end
    pause;
end