clc     
clear all
A=[1 1;3 8;10 7]
B=[4;24;35]
C=[5 7]
x=1:1:max(B)
m=size(A,1);
z1=(B(1)-A(1,1)*x)/A(1,2);
z2=(B(2)-A(2,1)*x)/A(2,2);
z3=(B(3)-A(3,1)*x)/A(3,2);
z1=max(0,z1);
z2=(max(0,z2));
z3=max(0,z3);v
plot(x,z1,'r',x,z2,'y',x,z3,'b')
cx=find(x==0);
c1=find(z1==0);
c2=find(z2==0);
c3=find(z3==0);
line1=[x([cx,c1]);z1([cx,c1])]';
line2=[x([cx,c2]);z2([cx,c2])]';
line3=[x([cx,c3]);z3([cx,c3])]';
cpt=unique([line1;line2;line3],'rows');
ptt=[0;0];
for i=1:size(A,1)    % nested loop to go throught all iterations of points
    A1=A(i,:)
    B1=B(i,:)
    for j=i+1:size(A,1)
        A2=A(j,:)
        B2=B(j,:)
        A4=[A1;A2]
        B4=[B1;B2]
        x=A4\B4
        ptt=[ptt x]   % appending new feasible points to ptt 
    end
end 
ict=ptt';
point=unique([cpt;ict],'rows');
feasible_points=[];
for i=1:m
    constraint1 = A(1,1)*point(i,1) + A(1,2)*point(i,2) - B(1);
    constraint2 = A(2,1)*point(i,1) + A(2,2)*point(i,2) - B(2);
    constraint3 = A(3,1)*point(i,1) + A(3,2)*point(i,2) - B(3);
    
    % Check if the point satisfies all inequality constraints
    if constraint1 <=0 && constraint2 <=0 && constraint3 <=0
        feasible_points = [feasible_points; point(i,:)];
    end
end
[value,index]=max(feasible_points*C')
value
