function bw2 = edu_imgcrop(bw)  
   
% find boundry of digit
[y2temp x2temp] = size(bw);  
x1=1;  
y1=1;  
x2=x2temp;  
y2=y2temp;  
   
% find left boundry
cntB=1;  
while (sum(bw(:,cntB))==0)  
   x1=x1+1;  
   cntB=cntB+1;  
end  
   
% find top boundry
cntB=1;  
while (sum(bw(cntB,:))==0)  
   y1=y1+1;  
   cntB=cntB+1;  
end  
   
% find right boundry
cntB=x2temp;  
while (sum(bw(:,cntB))==0)  
   x2=x2-1;  
   cntB=cntB-1;  
end  
   
% find bottom boundry
cntB=y2temp;  
while (sum(bw(cntB,:))==0)  
   y2=y2-1;  
   cntB=cntB-1;  
end  
bw2=imcrop(bw,[x1,y1,(x2-x1),(y2-y1)]);  