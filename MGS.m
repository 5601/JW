function [Q,R]=MGS(A)
n=size(A,1);
R=zeros(n);
r=norm(A(:,1),2);
Q=A(:,1)/r;
R(1,1)=r;
for i=2:n
    a=A(:,i);
    q=a;
    for j=1:(i-1)
        R(j,i)=Q(:,j)'*q;
        q=q-R(j,i)*Q(:,j);
    end
    r=norm(q,2);
    q=q/r;
    Q=[Q,q];R(i,i)=r;
end
end