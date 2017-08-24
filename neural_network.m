clear;
clc;
dt=importdata('data.csv');
data1=dt.data;
%rp=randperm(length(data));
%data1=data(rp,:);
data=data1(1:length(data1),2:785);
output1=data1(:,1);
for i=1:length(data1)  
    switch output1(i)  
        case 0  
            output(:,i)=[1 0 0 0 0 0 0 0 0 0]';  
        case 1  
            output(:,i)=[0 1 0 0 0 0 0 0 0 0]';  
        case 2  
            output(:,i)=[0 0 1 0 0 0 0 0 0 0]';  
        case 3  
            output(:,i)=[0 0 0 1 0 0 0 0 0 0]';  
        case 4  
            output(:,i)=[0 0 0 0 1 0 0 0 0 0]';  
        case 5  
            output(:,i)=[0 0 0 0 0 1 0 0 0 0]';  
        case 6  
            output(:,i)=[0 0 0 0 0 0 1 0 0 0]';  
        case 7  
            output(:,i)=[0 0 0 0 0 0 0 1 0 0]';  
        case 8  
            output(:,i)=[0 0 0 0 0 0 0 0 1 0]';  
        case 9  
            output(:,i)=[0 0 0 0 0 0 0 0 0 1]';  
    end  
end 
for i=1:length(data)
    for j=1:784
        if(data(i,j)~=0)
            data(i,j)=1;
        end
    end
end

%data2=code6(data1);
%input=[data2,count1',count2',count3',count4']';
input=data';
input_train=input(:,1:30000);  
output_train=output(:,1:30000);  
input_test=input(:,30001:40000);  
output_test=output(:,30001:40000);  

innum=784;  
outnum=10;  
for midnum=15:4:47;
   
w1=rands(midnum,innum);
b1=rands(midnum,1);  
w2=rands(midnum,outnum); 
b2=rands(outnum,1);  
   
w2_1=w2;w2_2=w2_1;  
w1_1=w1;w1_2=w1_1;  
b1_1=b1;b1_2=b1_1;  
b2_1=b2;b2_2=b2_1;  
   

xite=0.1;  
alfa=0.01;  

for i=1:30000
        x=input_train(:,i);  
        for j=1:1:midnum  
           I(j)=input_train(:,i)'*w1(j,:)'+b1(j);  
            Iout(j)=1/(1+exp(double(-I(j))));  
        end  
     
        yn=w2'*Iout'+b2;  
         
        e=output_train(:,i)-yn;      
%         E(ii)=E(ii)+sum(abs(e));  
        
        dw2=e*Iout;  
        db2=e';  
       
        for j=1:1:midnum  
            S=1/(1+exp(double(-I(j))));  
            FI(j)=S*(1-S);  
        end       
        for k=1:1:innum  
            for j=1:1:midnum  
               dw1(k,j)=FI(j)*x(k)*(w2(j,:)*e);%  
                db1(j)=FI(j)*(w2(j,:)*e);  
            end  
        end  
            
        w1=w1_1+xite*dw1';  
        b1=b1_1+xite*db1';  
        w2=w2_1+xite*dw2';  
        b2=b2_1+xite*db2';  
         
        w1_2=w1_1;w1_1=w1;  
        w2_2=w2_1;w2_1=w2;  
        b1_2=b1_1;b1_1=b1;  
        b2_2=b2_1;b2_1=b2;  
end  

   for i=1:10000%1500  
        
        for j=1:1:midnum  
           I(j)=input_test(:,i)'*w1(j,:)'+b1(j);  
            Iout(j)=1/(1+exp(double(-I(j))));  
        end  
         
        fore(:,i)=w2'*Iout'+b2;  
   end  
    
for i=1:10000 
   output_fore(i)=find(fore(:,i)==max(fore(:,i)))-1;  
end  
   

error=output_fore'-output1(30001:40000);  
correct=0;
for i=1:10000
    if(error(i)==0)
        correct=correct+1;
    end
end
correct=correct/length(error);
plot(midnum,correct,'-');
hold on
end

 
   
