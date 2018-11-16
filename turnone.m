function [Y,PS]=turnone(X)
ymax = max(X);
ymin = min(X);
PS = [ymax;ymin];
[m,n]=size(X);
Y = zeros(m,n);
for i=1:m
    for j=1:n
      Y(i,j) = 2*(X(i,j)-ymin)/(ymax-ymin) -1;
    end
end

end