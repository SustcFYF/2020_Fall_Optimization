clear
clc
%% Plot the map
xc=[30.3,66.0,98.4,73.7,57.9,86.8,93.6];
yc=[89.8,84.7,76.7,61.0,47.6,22.0,48.8];
Lc=['A','B','C','D','E','F','G'];
r=5;
xd=[45,70,78.4];
yd=[65,35,86.7];
Ld=['M','N','P'];
rd=[8,4,4];
theta=0:pi/100:2*pi;
for i=1:1:7
    plot(xc(i),yc(i),'black.');
    text(xc(i)+1,yc(i),Lc(i))
    hold on;
    xt=xc(i)+r*cos(theta);
    yt=yc(i)+r*sin(theta);
    plot(xt,yt,'r')
    hold on
end
for i=1:1:3
    plot(xd(i),yd(i),'black.');
    text(xd(i)+1,yd(i),Ld(i))
    hold on;
    xt=xd(i)+rd(i)*cos(theta);
    yt=yd(i)+rd(i)*sin(theta);
    plot(xt,yt,'b')
    hold on
end
axis equal
grid on
xlim([10,120])
ylim([-10,100])
xlabel('x')
ylabel('y')
plot(110,0,'*')
text(111,0,'H')
%% Generate discrete points
clc
index=0;
x_disc=zeros(1,2219);
y_disc=zeros(1,2219);
for i=1:1:7
    for xi=xc(i)-4.5:1:xc(i)+4.5
        for yi=yc(i)-4.5:1:yc(i)+4.5
            if (xi-xc(i))^2+(yi-yc(i))^2<=25
                plot(xi,yi,'black.')
                fprintf(' %f %f;\n',xi,yi);
                index=index+1;
                x_disc(index)=xi;
                y_disc(index)=yi;
                hold on
            end
        end
    end
end
axis equal
grid on
xlabel('x')
ylabel('y')
xlim([20,120])
ylim([-10,100])
plot(110,0,'*')
%% calculate the time used in each point
figure
for rcir=0.5:1:4.5
    for theta=0:pi/20:2*pi
        xcir=rcir*cos(theta);
        ycir=rcir*sin(theta);
        plot(xcir,ycir,'r.')
        for theta2=0:pi/20:2*pi
            xcir2=xcir+0.5*cos(theta2);
            ycir2=ycir+0.5*sin(theta2);
            plot(xcir2,ycir2,'b.')
            hold on
        end
        hold on
    end
end
axis equal
%% Generate points
index=0;
for xi=-4.5:0.5:4.5
        for yi=-4.5:0.5:4.5
            if xi^2+yi^2<=25
                plot(xi,yi,'blacko')
                index=index+1;
                x_disc(index)=xi;
                y_disc(index)=yi;
                
        fprintf(' %f %f;\n',xi,yi);
                hold on
            end
        end
        axis equal
end
theta=0:pi/500:2*pi;
xcir=5*cos(theta);
ycir=5*sin(theta);
plot(xcir,ycir,'r')
%% generate circles
theta=0:pi/100:2*pi;
xcir=5*cos(theta);
ycir=5*sin(theta);
plot(xcir,ycir,'r')
hold on
for r=0.5:1:4.5
    theta=0:pi/200:2*pi;
    xcir=r*cos(theta);
    ycir=r*sin(theta);
    plot(xcir,ycir,'b')
    hold on
end
x=0:0.01:5;
plot(x,zeros(501,1),'b')
xlabel('x')
ylabel('y')
axis equal
%% first result
xc=[30.3,66.0,98.4,73.7,57.9,86.8,93.6];
yc=[89.8,84.7,76.7,61.0,47.6,22.0,48.8];
h=[110,0];
Lc=['A','B','C','D','E','F','G'];
r=5;
theta=0:pi/100:2*pi;

for i=1:1:7
    plot(xc(i),yc(i),'black.');
    text(xc(i)+1,yc(i),Lc(i))
    hold on;
    xt=xc(i)+r*cos(theta);
    yt=yc(i)+r*sin(theta);
    plot(xt,yt,'k')
    hold on
end
axis equal
grid on
xlabel('x')
ylabel('y')
plot(110,0,'*')
text(111,0,'H')

line([xc(1),h(1)],[yc(1),h(2)],'color','b')
line([xc(5),h(1)],[yc(5),h(2)],'color','g')
line([xc(6),h(1)],[yc(6),h(2)],'color','g')
line([xc(5),xc(6)],[yc(5),yc(6)],'color','g')
line([xc(2),h(1)],[yc(2),h(2)],'color','r')
line([xc(4),h(1)],[yc(4),h(2)],'color','r')
line([xc(2),xc(4)],[yc(2),yc(4)],'color','r')
line([xc(3),h(1)],[yc(3),h(2)],'color',[0.67 0 1])
line([xc(7),h(1)],[yc(7),h(2)],'color',[0.67 0 1])
line([xc(3),xc(7)],[yc(3),yc(7)],'color',[0.67 0 1])
for r=0.5:1:4.5
    theta=0:pi/200:2*pi;
    xcir1=xc(1)+r*cos(theta);
    ycir1=yc(1)+r*sin(theta);
    xcir2=xc(5)+r*cos(theta);
    ycir2=yc(5)+r*sin(theta);
    xcir3=xc(6)+r*cos(theta);
    ycir3=yc(6)+r*sin(theta);
    xcir4=xc(2)+r*cos(theta);
    ycir4=yc(2)+r*sin(theta);
    xcir5=xc(4)+r*cos(theta);
    ycir5=yc(4)+r*sin(theta);
    xcir6=xc(3)+r*cos(theta);
    ycir6=yc(3)+r*sin(theta);
    xcir7=xc(7)+r*cos(theta);
    ycir7=yc(7)+r*sin(theta);
    plot(xcir1,ycir1,'b')
    plot(xcir2,ycir2,'g')
    plot(xcir3,ycir3,'g')
    plot(xcir4,ycir4,'r')
    plot(xcir5,ycir5,'r')
    plot(xcir6,ycir6,'color',[0.67 0 1])
    plot(xcir7,ycir7,'color',[0.67 0 1])
    hold on
end
title('The Shortest Path for Four Drones')
