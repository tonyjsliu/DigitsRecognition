function f=freeman8(data1)
%data1=xlsread('new.csv');
d=zeros(length(data1),8);
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
    z=loc(a);
    B=bwtraceboundary(a,z,'E',8);
    for i=1:length(B)-1
        if(B(i,1)==B(i+1,1)+1&&B(i,2)==B(i+1,2))
            %s(k,i)=0;
            d(k,1)=d(k,1)+1;
        elseif(B(i,1)==B(i+1,1)+1&&B(i,2)==B(i+1,2)-1)
            %s(k,i)=1;
            d(k,2)=d(k,2)+1;
        elseif(B(i,1)==B(i+1,1)&&B(i,2)==B(i+1,2)-1)
            %s(k,i)=2;
            d(k,3)=d(k,3)+1;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2)-1)
            %s(k,i)=3;
            d(k,4)=d(k,4)+1;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2))
            %s(k,i)=4;
            d(k,5)=d(k,5)+1;
        elseif(B(i,1)==B(i+1,1)-1&&B(i,2)==B(i+1,2)+1)
            %s(k,i)=5;
            d(k,6)=d(k,6)+1;
        elseif(B(i,1)==B(i+1,1)&&B(i,2)==B(i+1,2)+1)
            %s(k,i)=6;
            d(k,7)=d(k,7)+1;
        else
            %s(k,i)=7;
            d(k,8)=d(k,8)+1;
        end
    end
    for i=1:8
        d(k,i)=d(k,i)/length(B);
    end
end
f=d;