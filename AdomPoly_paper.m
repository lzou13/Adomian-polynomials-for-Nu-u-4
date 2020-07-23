function sol=AdomPoly_paper(expression,nth)
% Coded by H. F. & H. A., Feb, 2011
% clear all
% syms u0 u1 u2
% expression=(u0+u1+u2)^2;
% nth=2
Ch=char(expand(expression));
s=strread(Ch, '%s', 'delimiter', '+');

for i=1:length(s)
    t=strread(char(s(i)), '%s', 'delimiter', '*()expulogsinh');
    t=strrep(t,'^','*');
    % expression should be composed by u0 u1 u2....
    if length(t)~=2
        p=str2num(char(t));
        sumindex=sum(p)-p(1);
    else
        sumindex=str2num(char(t));
    end
    list(i)=sumindex;
end

A='';
for j=1:length(list)
    if nth==list(j)
        A=strcat(A,s(j),'+');
    end
end
N=length(char(A))-1;
F=strcat ('%',num2str(N),'c%n');
sol=sscanf(char(A),F);
