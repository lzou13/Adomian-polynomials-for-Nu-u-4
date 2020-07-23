clear all
% 定义符号数组u(100,1)
u = sym('u',[100,1]);
% 确定An阶数
nth=20


i=nth;
temp=0;
tic
for j=0:i
    %     for k=i-j:-1:0
    for k=0:i
        % Computer component of Adomian polynomials for Nu=u^3
        % For other nonlinear form ,just replace the following part
%         if i-j-k+1<=0
%             continue
%         end
        for m=0:i
            l=i-j-k-m;
            if l+1<=0 
                continue
            end
            temp=temp+u(j+1)*u(k+1)*u(l+1)*u(m+1);
        end
    end
end
toc
% Adomian polynomials integration
% Be careful the resulting polymials each subscript is one more than the real result.
An=temp
