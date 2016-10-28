clc;
clear;
pare=2;
vetor=-10:.001:10;
Fa=input('Entre com a função >>\n');
%e=input('Entre com o erro>>\n');
teste=input('entre com o numero de interações');
X(1)=input('Entre com o valor de xo >>\n');
Fb=polyder(Fa);

%modificações--------------------------------------
T=Fa;
size_fa=size(Fa);
size_fa(1,2)=size_fa(1,2)-2;
for i=1:size_fa(1,2)
    T=polyder(T);
end
ey=polyval(Fa,vetor);%cirando função fixa para plotagem
plot(vetor,ey)%plotando função
hold on
grid on
%fim modificações-----------------------------------

for i=1:teste
    a=polyval(Fa,X(i));
    b=polyval(Fb,X(i));
    
    %modificações 2-----------------------------------------
    %testando plotagem para ilustrar(atravez das retas tangentes) o
    %funcionamento do metodo 
    c=polyval(T,X(i));
    retang=(((c*vetor)+(-c*X(i)))+a);%eq. da reta tangente
    plot(vetor,retang)%plotando reta tangente
    %fim modicações-----------------------------------------
    
    x(i)=X(i)-(a/b);
    X(i+1)=x(i);
    pare=X(i)-x(i);
    %if(pare<=e) /para caso queira trabalhar com o erro é só colocar
     %   break;  /teste=input como comentario e tirar o resto do comentario
    %end
    %pare=i+1;
end

x
pare

