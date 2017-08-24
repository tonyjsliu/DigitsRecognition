function f=freeman(data1)
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
    B=bwtraceboundary(a,z,'E',8);
    for i=1:length(B)-1
        if(B(i,1)==B(i+1,1)+1&&B(i,2)==B(i+1,2))
            s(k,i)=0;
        elseif(B(i,1)==B(i+1,1)+1&&B(i,2)==B(i+1,2)-1)
            s(k,i)=1;
        elseif(B(i,1)==B(i+1,1)&&B(i,2)==B(i+1,2)-1)
            s(k,i)=2;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2)-1)
            s(k,i)=3;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2))
            s(k,i)=4;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2)+1)
            s(k,i)=5;
        elseif(B(i,1)==B(i+1,1)&&B(i,2)==B(i+1,2)+1)
            s(k,i)=6;
        else
            s(k,i)=7;
        end
    end
end
f=s;