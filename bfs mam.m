clc
clear all
C = [2 3 4 7];
A = [2 3 -1 4; -1 2 -6 7];
b = [8; 3];
m = size(A,1);
n = size(A,2);
if n>m
    p = nchoosek(n,m);
    q = nchoosek(1:n,m);
else
    disp('Invalid constraint');
end
bs = [];
bfs = [];
for i = 1:p
    B = A(:,q(i,:));
    if det(B) ~= 0
        x = B\b;
    else
        continue;
    end
    y = zeros(n,1);
    y(q(i,:)) = x;
    bs = [bs y];
    if y>=0
        bfs = [bfs y];
    end
end
j = C*bfs;
[opt_val,pos] = max(j);
disp(opt_val);
disp(bfs(:,pos)');
