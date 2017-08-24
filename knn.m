K=11;%function f=knn(K)
dt=importdata('data.csv');
data=dt.data;
rp=randperm(length(data));
data=data(rp,:);
correct=0;
wrong=0; 
train_data=data(1:length(data)/2,:);
test_data=data(length(data)/2+1:end,:);
train_data_=train_data(:,2:785);
test_data_=test_data(:,2:785);
for i=1:length(test_data_)
    n=knnsearch(train_data_,test_data_(i,:),'k',K);
    tmp=zeros(1,11);
    value=0;
    for j=1:K
        tmp(train_data(n(j),1)+1)=tmp(train_data(n(j),1)+1)+1;
    end
    for j=1:10
        if(tmp(11)<tmp(j))
            tmp(11)=tmp(j);
            value=j;
        end
    end
    if(value-1==test_data(i,1))
        correct=correct+1;
    else
        wrong=wrong+1;
    end
end
correct;
wrong;
result=correct/(correct+wrong);


