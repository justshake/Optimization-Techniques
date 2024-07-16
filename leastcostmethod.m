clc
clear all
%LeastCostMethod
%c=cost
%a=supply
%b=demand
c=[11 20 17 8;21 16 10 12;8 12 18 9]
a=[50 40 70 ]
b=[30 25 35 70]
m=size(c,1)
n=size(c,2)
z=0
if sum(a)==sum(b)
disp('balanced problem')
else
    disp('unbalanced')
    if sum(a) <sum(b)
        c(end+1,:)=zeros(1,n)
        a(end+1)=sum(b)-sum(a)
    else
          c(:,end+1)=zeros(m,1)
        b(end+1)=sum(a)-sum(b)
    end
end
x=zeros(m,n)
initialc = c;
for i=1:m
    for j=1:n
      cpq=min(c(:))
      [p1,q1]=find(cpq==c)
      xpq=min(a(p1),b(q1))
      [val,index]=max(xpq)
      p=p1(index);
      q=q1(index);
       
    
x(p,q)=min(a(p),b(q))
if min(a(p),b(q))==a(p)
    b(q)=b(q)-a(p)
    a(p)=a(p)-x(p,q)
    c(p,:)=Inf;
else
    a(p)=a(p)-b(q)
    b(q)=b(q)-x(p,q)
    c(:,q)=Inf
end
end
end

for i=1:m
    for j=1:n
   z=z+initialc(i,j)*x(i,j)
    end
end
