%function f=MLE(num)
data1=xlsread('new.csv');
result=zeros(1,1);
for count=1:1
    c1=zeros(1,length(data1));
    c2=zeros(1,length(data1));
    for j=1:length(data1)
    for i=2:393
        if(data1(j,i)~=0)
            c1(j)=c1(j)+1;
        end
    end
    for i=394:785
        if(data1(j,i)~=0)
            c2(j)=c2(j)+1;
        end
    end
    count1(j)=c1(j)/(c1(j)+c2(j));
    count2(j)=c2(j)/(c2(j)+c1(j));
    end
    c3=zeros(1,length(data1));
    c4=zeros(1,length(data1));
    for j=1:length(data1)
        for ii=1:28
            for jj=1:14
                if(data1(j,28*ii-28+jj)~=0)
                    c3(j)=c3(j)+1;
                end
            end
            for jj=15:28
                if(data1(j,28*ii-28+jj)~=0)
                    c4(j)=c4(j)+1;
                end
            end
        end
        count3(j)=c3(j)/(c3(j)+c4(j));
        count4(j)=c4(j)/(c3(j)+c4(j));
    end    
 
    data2=code6(data1);
    data=[data1(:,1),data2,count1',count2',count3',count4'];
    train_data=data(1:(length(data)-1)/2,:);
    test_data=data((length(data)-1)/2+1:end,:);
    active_feat=2:13;
   
         prior0tmp=length(train_data(train_data(:,1)==0));
         prior1tmp=length(train_data(train_data(:,1)==1));
         prior2tmp=length(train_data(train_data(:,1)==2));
         prior3tmp=length(train_data(train_data(:,1)==3));
         prior4tmp=length(train_data(train_data(:,1)==4));
         prior5tmp=length(train_data(train_data(:,1)==5));
         prior6tmp=length(train_data(train_data(:,1)==6));
         prior7tmp=length(train_data(train_data(:,1)==7));
         prior8tmp=length(train_data(train_data(:,1)==8));
         prior9tmp=length(train_data(train_data(:,1)==9));
         prior0=prior0tmp/length(train_data);
         prior1=prior1tmp/length(train_data);
         prior2=prior2tmp/length(train_data);
         prior3=prior3tmp/length(train_data);
         prior4=prior4tmp/length(train_data);
         prior5=prior5tmp/length(train_data);
         prior6=prior6tmp/length(train_data);
         prior7=prior7tmp/length(train_data);
         prior8=prior8tmp/length(train_data);
         prior9=prior9tmp/length(train_data);
         mean0=mean(train_data(train_data(:,1)==0,active_feat));
         mean1=mean(train_data(train_data(:,1)==1,active_feat));
         mean2=mean(train_data(train_data(:,1)==2,active_feat));
         mean3=mean(train_data(train_data(:,1)==3,active_feat));
         mean4=mean(train_data(train_data(:,1)==4,active_feat));
         mean5=mean(train_data(train_data(:,1)==5,active_feat));
         mean6=mean(train_data(train_data(:,1)==6,active_feat));
         mean7=mean(train_data(train_data(:,1)==7,active_feat));
         mean8=mean(train_data(train_data(:,1)==8,active_feat));
         mean9=mean(train_data(train_data(:,1)==9,active_feat));
         cov0=cov(train_data(train_data(:,1)==0,active_feat));
         cov1=cov(train_data(train_data(:,1)==1,active_feat));
         cov2=cov(train_data(train_data(:,1)==2,active_feat));
         cov3=cov(train_data(train_data(:,1)==3,active_feat));
         cov4=cov(train_data(train_data(:,1)==4,active_feat));
         cov5=cov(train_data(train_data(:,1)==5,active_feat));
         cov6=cov(train_data(train_data(:,1)==6,active_feat));
         cov7=cov(train_data(train_data(:,1)==7,active_feat));
         cov8=cov(train_data(train_data(:,1)==8,active_feat));
         cov9=cov(train_data(train_data(:,1)==9,active_feat));
    correct=0;
    wrong=0;
    for i=1:length(test_data)
        
            lklhood0=exp(-1/2*(test_data(i,active_feat)-mean0)*inv(cov0)*(test_data(i,active_feat)-mean0)')/sqrt(det(cov0));
            lklhood1=exp(-1/2*(test_data(i,active_feat)-mean1)*inv(cov1)*(test_data(i,active_feat)-mean1)')/sqrt(det(cov1));
            lklhood2=exp(-1/2*(test_data(i,active_feat)-mean2)*inv(cov2)*(test_data(i,active_feat)-mean2)')/sqrt(det(cov2));
            lklhood3=exp(-1/2*(test_data(i,active_feat)-mean3)*inv(cov3)*(test_data(i,active_feat)-mean3)')/sqrt(det(cov3));
            lklhood4=exp(-1/2*(test_data(i,active_feat)-mean4)*inv(cov4)*(test_data(i,active_feat)-mean4)')/sqrt(det(cov4));
            lklhood5=exp(-1/2*(test_data(i,active_feat)-mean5)*inv(cov5)*(test_data(i,active_feat)-mean5)')/sqrt(det(cov5));
            lklhood6=exp(-1/2*(test_data(i,active_feat)-mean6)*inv(cov6)*(test_data(i,active_feat)-mean6)')/sqrt(det(cov6));
            lklhood7=exp(-1/2*(test_data(i,active_feat)-mean7)*inv(cov7)*(test_data(i,active_feat)-mean7)')/sqrt(det(cov7));
            lklhood8=exp(-1/2*(test_data(i,active_feat)-mean8)*inv(cov8)*(test_data(i,active_feat)-mean8)')/sqrt(det(cov8));
            lklhood9=exp(-1/2*(test_data(i,active_feat)-mean9)*inv(cov9)*(test_data(i,active_feat)-mean9)')/sqrt(det(cov9));
            post0=lklhood0*prior0;
            post1=lklhood1*prior1;
            post2=lklhood2*prior2;
            post3=lklhood3*prior3;
            post4=lklhood4*prior4;
            post5=lklhood5*prior5;
            post6=lklhood6*prior6;
            post7=lklhood7*prior7;
            post8=lklhood8*prior8;
            post9=lklhood9*prior9;
            Max=0;
            post=[post0,post1,post2,post3,post4,post5,post6,post7,post8,post9];
            check=0;
            for ii=1:10
                if(Max<post(ii))
                    Max=post(ii);
                    check=ii-1;
                end
            end
            if(test_data(i,1)==check)
                correct=correct+1;
            end
    end
    result(count)=result(count)+correct/length(test_data);
end
f=[mean(result), std(result)];