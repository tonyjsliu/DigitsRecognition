function f=code4(data1)
d=zeros(length(data1),4);
for k=1:length(data1)
    for i=2:785
        data2(i-1)=data1(k,i);
    end
    for i=1:28
        for j=1:28
            if(data2(i*28-28+j)==0)
                a(i,j)=0;
            else
                a(i,j)=1;
            end
        end
    end
    %imshow(a);
    z=loc(a);
    B=bwtraceboundary(a,z,'E',4);
    for i=1:length(B)-1
        if(B(i,1)==B(i+1,1)&&B(i,2)==B(i+1,2)-1)
            d(k,1)=d(k,1)+1;
        elseif(B(i,1)==B(i+1,1)&&B(i,2)==B(i+1,2)+1)
            d(k,2)=d(k,2)+1;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2))
            d(k,3)=d(k,3)+1;
        else
            d(k,4)=d(k,4)+1;
        end
    end
    for i=1:4
        s(k,i)=d(k,i)/(d(k,1)+d(k,2)+d(k,3)+d(k,4));
    end
end
f=s;