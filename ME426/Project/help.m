clc
xy = [110 30.3 66.0 98.4 73.7 57.9 86.8 93.6; 
      0 89.8 84.7 76.7 61.0 47.6 22.0 48.8]';
d = zeros(8,8);
for i=1:8
    for j=1:8
        d(i,j)=sqrt((xy(i,1)-xy(j,1))^2+(xy(i,2)-xy(j,2))^2);
        if d(i,j)==0
            d(i,j)=100000;
        end
    end
end
for k=1:4
    for i=1:8
        for j=1:8
            fprintf('%f ',d(i,j))
        end
    end
end
