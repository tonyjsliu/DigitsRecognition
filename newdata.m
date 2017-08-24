%change size to 16*16
da=importdata('data.csv');
dat=da.data;
data=dat(:,2:785);
s=16;
for i=1:length(data)
    for j=1:784
        if(data(i,j)~=0)
            data(i,j)=1;
        end
    end
    for ii=1:28
        for jj=1:28
            a(ii,jj)=data(i,28*ii-28+jj);
        end
    end
    bw=edu_imgcrop1(a);
    bw2=imresize(bw,[s,s]);  
    for ii=1:length(bw2)
        for jj=1:length(bw2)
            if(abs(bw2(ii,jj))>0.5)
                bw2(ii,jj)=1;
            else
                bw2(ii,jj)=0;
            end
        end
    end
    for ii=1:length(bw2)
        for jj=1:length(bw2)
            data_new1(i,(ii-1)*length(bw2)+jj)=bw2(ii,jj);
        end
    end
end
data_new=[dat(:,1),data_new1];