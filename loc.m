function f=loc(a)
for i=1:28
    for j=1:28
        if(a(i,j)==1)
            f=[i,j];
            return;
        end
    end
end