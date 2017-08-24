 %function f=NB(num)
dt=importdata('data.csv');
data1=dt.data;
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
 
    data2=freeman8(data1);
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
         var0=var(train_data(train_data(:,1)==0,active_feat));
         var1=var(train_data(train_data(:,1)==1,active_feat));
         var2=var(train_data(train_data(:,1)==2,active_feat));
         var3=var(train_data(train_data(:,1)==3,active_feat));
         var4=var(train_data(train_data(:,1)==4,active_feat));
         var5=var(train_data(train_data(:,1)==5,active_feat));
         var6=var(train_data(train_data(:,1)==6,active_feat));
         var7=var(train_data(train_data(:,1)==7,active_feat));
         var8=var(train_data(train_data(:,1)==8,active_feat));
         var9=var(train_data(train_data(:,1)==9,active_feat));
    correct=0;
    wrong=0;
    check=zeros(1,length(test_data));
    for i=1:length(test_data)
        lklhood0=1;
        lklhood1=1;
        lklhood2=1;
        lklhood3=1;
        lklhood4=1;
        lklhood5=1;
        lklhood6=1;
        lklhood7=1;
        lklhood8=1;
        lklhood9=1;
        for j=1:12
            lklhood0=lklhood0*exp(-(test_data(i,j+1)-mean0(j))^2/(2*var0(j)))/sqrt(var0(j));
            lklhood1=lklhood1*exp(-(test_data(i,j+1)-mean1(j))^2/(2*var1(j)))/sqrt(var1(j));
            lklhood2=lklhood2*exp(-(test_data(i,j+1)-mean2(j))^2/(2*var2(j)))/sqrt(var2(j));
            lklhood3=lklhood3*exp(-(test_data(i,j+1)-mean3(j))^2/(2*var3(j)))/sqrt(var3(j));
            lklhood4=lklhood4*exp(-(test_data(i,j+1)-mean4(j))^2/(2*var4(j)))/sqrt(var4(j));
            lklhood5=lklhood5*exp(-(test_data(i,j+1)-mean5(j))^2/(2*var5(j)))/sqrt(var5(j));
            lklhood6=lklhood6*exp(-(test_data(i,j+1)-mean6(j))^2/(2*var6(j)))/sqrt(var6(j));
            lklhood7=lklhood7*exp(-(test_data(i,j+1)-mean7(j))^2/(2*var7(j)))/sqrt(var7(j));
            lklhood8=lklhood8*exp(-(test_data(i,j+1)-mean8(j))^2/(2*var8(j)))/sqrt(var8(j));
            lklhood9=lklhood9*exp(-(test_data(i,j+1)-mean9(j))^2/(2*var9(j)))/sqrt(var9(j));
        end
        post0=lklhood0*prior0;
        post1=lklhood1*prior1;
        post2=lklhood2*prior2;
        post3=lklhood1*prior3;
        post4=lklhood1*prior4;
        post5=lklhood1*prior5;
        post6=lklhood1*prior6;
        post7=lklhood1*prior7;
        post8=lklhood1*prior8;
        post9=lklhood1*prior9;
        Max=0;
            post=[post0,post1,post2,post3,post4,post5,post6,post7,post8,post9];
            for ii=1:10
                if(Max<post(ii))
                    Max=post(ii);
                    check(i)=ii-1;
                end
            end
            if(test_data(i,1)==check(i))
                correct=correct+1;
            end
    end
    result=correct/length(test_data);
end
f=[mean(result),std(result)];