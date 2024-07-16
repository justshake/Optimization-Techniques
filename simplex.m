clc
clear all
A=[1 1;2 1]
b=[12;16]
c=[40 30]
m=size(A,1)
A=[A eye(m)]
c=[c zeros(1,m)]
n=size(A,2)
y=[A b]
bv_index=n-m+1:n
for i=1:300
cb=c(bv_index)
zjcj=cb*y(:,1:n)-c
xb=y(:,end)
if zjcj>=0
disp('opt_sol:')
xb
bv_index
z=cb*xb
break
else
[value,EV]=min(zjcj)
for i=1:m
    if y(i,EV)>0
    ratio(i)=xb(i)/y(i,EV)
    else
        ratio(i)=INF
    end
end
[value,LV]=min(ratio)
bv_index(LV)=EV
end
pivot=y(LV,EV)
y(LV,:)=y(LV,:)/pivot
for i=1:m
if i~=LV
y(i,:)=y(i,:)-y(i,EV)*y(LV,:)

end
end
    end
