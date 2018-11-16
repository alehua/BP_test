function [X]=resturnone(Y,PS)
ymax = PS(1,1);
ymin = PS(2,1);
[m,n]=size(Y);
X = zeros(m,n);
for i=1:m
    for j=1:n
      X(i,j) = (Y(i,j)+1)*(ymax-ymin)/2+ymin;
    end
end

end