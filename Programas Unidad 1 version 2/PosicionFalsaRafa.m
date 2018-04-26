%Método de Posición Falsa - Tipo guión
%f(x)=0
clc
clear all %#ok<CLALL> (Matlab lo puso)
disp('Método de Posición Falsa')
disp(' ')
syms x
f=input('Introduzca la función f(x): ');
P0=input('Introduzca el valor de P0: ');
P1=input('Introduzca el valor de P1: ');
error=input('Introduzca el valor de la presición deseada: ');
fP0=subs(f,P0);
fP1=subs(f,P1);
if fP1*fP0<0
    P2=P1-((fP1*(P1-P0))/(fP1-fP0));
    tol=abs(P2-P1);
    cont=1;
    disp(' n         P0                 P1                P2               error')
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %e\n',cont,P0,P1,P2,tol)
    while tol>error
        cont=cont+1;
        fP2=subs(f,P2);
        if (fP1*fP2)<0
            P0=P1;
            P1=P2;
        else
            if (fP0*fP2)<0
                P0=P0; %#ok<ASGSL> (Matlab lo puso)
                P1=P2;
            end
        end
        fP0=subs(f,P0);
        fP1=subs(f,P1);
        P2=P1-(((fP1)*(P1-P0))/((fP1)-(fP0)));
        tol=abs(P2-P1);
        fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %e\n',cont,P0,P1,P2,tol)
    end
end
disp (' ')
fprintf('EL valor de P2 aproximadamente es: %9.15f\n',P2)  