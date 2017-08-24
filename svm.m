da=importdata('data.csv');
data=da.data;
train_data=data(1:length(data)/2,:);
test_data=data(length(data)/2+1:end,:);
model=svmtrain(train_data(:,1),sparse(train_data(:,2:785)),'-t 1 -d 2 -g 11');%'-t 2 -d 2 -c 60 -g 11'
x=svmpredict(test_data(:,1),spares(test_data(:,2:785)),model,'-b 0');
correct=0;
for i=1:length(x)
    if(b(i)==test_data(i,1))
        correct=correct+1;
    end
end
result=correct/length(x);