%Xiao Wei
%a demo of perceptron learning algorithm
%Sep 2012

clear

%%data generating
data_set=ones(4,100);
l=length(data_set(1,:));
data_set(1:2,1:l)=10*rand(2,l);


w_sep=[1,0.5,-9]; %define separator%

%%checking separator
while (length(find(w_sep*data_set(1:3,:)))~=l)
    w_sep=w_sep+rand(1,3);
end

%generating separator line points
x=0:0.01:10;
y=-(w_sep(2)*x+w_sep(3))/w_sep(1);
line=(y>=0)&(y<=10);

%marking data points
data_set(4,:)=sign(w_sep*data_set(1:3,:));
pos_data=data_set(1:3,(data_set(4,:)==1));
neg_data=data_set(1:3,(data_set(4,:)==-1));

%plot data points and separator line
plot(pos_data(2,:),pos_data(1,:),'bo');hold on
xlabel('x1')
ylabel('x2')
plot(neg_data(2,:),neg_data(1,:),'rx');
plot(x(line),y(line),'--g');


%PLA
w=[0,0,0];

y=-(w(2)*x+w(3))/w(1);
line2=(y>=0)&(y<=10);
x2=x(line2);y2=y(line2);
plot(x2,y2);

update=0;
while isequal(sign(w*data_set(1:3,:)),data_set(4,:))==0
    for i=1:l
        yt=sign(w*data_set(1:3,i));
        if yt*data_set(4,i)~=1
            w=w+data_set(4,i)*data_set(1:3,i)';
            update=update+1;
        end
    end
end
y2=-(w(2)*x+w(3))/w(1);
line2=(y2>=0)&(y2<=10);
plot(x(line2),y2(line2))







