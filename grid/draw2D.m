%clear

fileID = fopen('grid_7.txt','r');

formatSpec = '%d %f %f';
sizeA = [3 Inf];

A = fscanf(fileID,formatSpec,sizeA);
X = [];
Y = [];

numPoint = length(A);
strokeNum = 0;

for i = 1 : numPoint
    if A(1,i) == strokeNum 
        y = A(2,i);%*720;
        x = A(3,i);%*1280;
        %x = A(2,i)*720/2;
        %y = A(3,i)*1280/2;
        X = [X x]; % add points
        Y = [Y y];
        
    else % next stroke
        plot(X',Y','k');
        hold on;
        strokeNum = strokeNum + 1;
        X = [];
        Y = [];
    end
end

plot(X',Y','k');
axis equal

%axis([-153.5/78.6 153.5/78.6 -1 1]);
%axis([0 1280 0 1280]);
%axis([-640 640 -640 640]);
%axis off;
%axis([0 1 0 1]);
xlim([-0.5 1.5])
ylim([-0.5 1.5])
fclose(fileID);