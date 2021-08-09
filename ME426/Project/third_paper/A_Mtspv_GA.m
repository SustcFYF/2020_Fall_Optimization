function varargout = A_Mtspv_GA(xy,dmat,nSalesmen,minTour,popSize,numIter,showProg,showResult) 
% Process Inputs and Initialize Defaults
nargs = 8; 
for k = nargin:nargs-1 
    switch k
        case 0 
            xy = [30.3 66.0 98.4 73.7 57.9 86.8 93.6 110; 
               89.8 84.7 76.7 61.0 47.6 22.0 48.8 0]';
        case 1
            N = size(xy,1);
            a = meshgrid(1:N);
            dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),N,N); 
        case 2
            nSalesmen = 3;
        case 3
            minTour = 2;
        case 4
            popSize = 80;
        case 5
            numIter = 5e3;
        case 6
            showProg = 1;
        case 7
            showResult = 1;
        otherwise
    end
end
    % Verify Inputs 
[N,dims] = size(xy);
[nr,nc] = size(dmat); 
if N ~= nr || N ~= nc 
    error('Invalid XY or DMAT inputs!')
end
n = N;
% Sanity Checks 
minTour = max(1,min(n,round(real(minTour(1)))));
popSize = max(8,8*ceil(popSize(1)/8)); 
numIter = max(1,round(real(numIter(1)))); 
showProg = logical(showProg(1)); 
showResult = logical(showResult(1)); 
% Initialize the Populations
popRoute = zeros(popSize,n); 
% population of routes 
popBreak = cell(popSize,1); 
% population of breaks
for k = 1:popSize
    popRoute(k,:) = randperm(n);
    popBreak{k} = rand_breaks();
end
% Select the Colors for the Plotted Routes
pclr = ~get(0,'DefaultAxesColor'); 
clr = hsv(floor(n/minTour));
% Run the GA 
globalMin = Inf;
totalDist = zeros(1,popSize);
distHistory = zeros(1,numIter); 
tmpPopRoute = zeros(8,n); 
tmpPopBreak = cell(8,1);
newPopRoute = zeros(popSize,n); 
newPopBreak = cell(popSize,1); 
if showProg
    pfig = figure('Name','遗传算法（GA）','Numbertitle','off');
end
for iter = 1:numIter
    % Evaluate Each Population Member (Calculate Total Distance) 
    for p = 1:popSize 
        d = 0; 
        pRoute = popRoute(p,:);
        pBreak = popBreak{p};
        nSalesmen = length(pBreak)+1;
        rng = [[1 pBreak+1];[pBreak n]]'; 
        for s = 1:nSalesmen
            d = d + dmat(pRoute(rng(s,2)),pRoute(rng(s,1))); 
            for k = rng(s,1):rng(s,2)-1 
                d = d + dmat(pRoute(k),pRoute(k+1)); 
            end
        end
        totalDist(p) = d;
    end
    % Find the Best Route in the Population
    [minDist,index] = min(totalDist);
    distHistory(iter) = minDist;
    if minDist < globalMin 
        globalMin = minDist;
        optRoute = popRoute(index,:);
        optBreak = popBreak{index};
        nSalesmen = length(optBreak)+1; 
        rng = [[1 optBreak+1];[optBreak n]]';
        if showProg 
            % Plot the Best Route 
            figure(pfig); 
            for s = 1:nSalesmen 
                rte = optRoute([rng(s,1):rng(s,2) rng(s,1)]); 
                if dims > 2, plot3(xy(rte,1),xy(rte,2),xy(rte,3),'.-','Color',clr(s,:));
                else plot(xy(rte,1),xy(rte,2),'.-','Color',clr(s,:)); 
                end
                title(sprintf(['ÔÖÇøÑ²²é×Üº½³Ì = %1.4f KM, ÎÞÈË»úÊýÁ¿ = %d ¼Ü, ' ...
                    'μü´ú = %d'],minDist,nSalesmen,iter)); 
                    hold on 
                    end
                    hold off
        end
    end
    text(26.300,89.100,'A');
    text(62.000,84.700,'B'); 
    text(94.400,76.700,'C'); 
    text(70.700,61.000,'D'); 
    text(54.900,47.600,'E');
    text(110.000,0,'H');
    
   % Genetic Algorithm Operators
   randomOrder = randperm(popSize); 
   for p = 8:8:popSize
       rtes = popRoute(randomOrder(p-7:p),:); 
       brks = popBreak(randomOrder(p-7:p));
       dists = totalDist(randomOrder(p-7:p)); 
       [ignore,idx] = min(dists); 
       bestOf8Route = rtes(idx,:);
       bestOf8Break = brks{idx};
       routeInsertionPoints = sort(ceil(n*rand(1,2))); 
       I = routeInsertionPoints(1); 
       J = routeInsertionPoints(2); 
       for k = 1:8
           % Generate New Solutions
           tmpPopRoute(k,:) = bestOf8Route;
           tmpPopBreak{k} = bestOf8Break;
           switch k 
               case 2 % Flip
                   tmpPopRoute(k,I:J) = tmpPopRoute(k,J:-1:I); 
               case 3 % Swap
                   tmpPopRoute(k,[I J]) = tmpPopRoute(k,[J I]); 
               case 4 % Slide 
                   tmpPopRoute(k,I:J) = tmpPopRoute(k,[I+1:J I]); 
               case 5 % Change Breaks 
                   tmpPopBreak{k} = rand_breaks();
               case 6 % Flip, Change Breaks
                   tmpPopRoute(k,I:J) = tmpPopRoute(k,J:-1:I); 
                   tmpPopBreak{k} = rand_breaks();
               case 7 % Swap, Change Breaks 
                   tmpPopRoute(k,[I J]) = tmpPopRoute(k,[J I]);
                   tmpPopBreak{k} = rand_breaks(); 
               case 8 % Slide, Change Breaks 
                   tmpPopRoute(k,I:J) = tmpPopRoute(k,[I+1:J I]);
                   tmpPopBreak{k} = rand_breaks(); 
               otherwise % Do Nothing 
           end
       end
       newPopRoute(p-7:p,:) = tmpPopRoute;
       newPopBreak(p-7:p) = tmpPopBreak;
   end
   popRoute = newPopRoute; 
   popBreak = newPopBreak;
end

if showResult
    % Plots 
    figure('Name','ÒÅ´«Ëã·¨£¨GA£© | ×îÖÕ½á¹û','Numbertitle','off'); 
    subplot(2,2,1);
    if dims > 2, plot3(xy(:,1),xy(:,2),xy(:,3),'.','Color',pclr); 
    else
        plot(xy(:,1),xy(:,2),'.','Color',pclr);
    end
    
    text(26.300,89.100,'A'); 
    text(62.000,84.700,'B'); 
    text(94.400,76.700,'C'); 
    text(70.700,61.000,'D');
    text(54.900,47.600,'E');
    text(110.000,0,'H'); 
    title('ÖØμãÇøÓòÎ»ÖÃ×ø±ê');
    subplot(2,2,2); 
    imagesc(dmat(optRoute,optRoute));
    title('¾àÀë¾ØÕó'); 
    nSalesmen = length(optBreak)+1; 
    subplot(2,2,3); 
    rng = [[1 optBreak+1];[optBreak n]]';
    for s = 1:nSalesmen
        rte = optRoute([rng(s,1):rng(s,2) rng(s,1)]); 
        if dims > 2,
            plot3(xy(rte,1),xy(rte,2),xy(rte,3),'.-','Color',clr(s,:));
        else
            plot(xy(rte,1),xy(rte,2),'.-','Color',clr(s,:));
        end
        text(26.300,89.100,'A');
        text(62.000,84.700,'B'); 
        text(94.400,76.700,'C'); 
        text(70.700,61.000,'D'); 
        text(54.900,47.600,'E');
        text(110.000,0,'H');
        title(sprintf('ÔÖÇéÑ²²é×Üº½³Ì = %1.4f KM',minDist));
        hold on; 
    end
    subplot(2,2,4); 
    plot(distHistory,'b','LineWidth',2) 
    title('ÀúÊ·×îÓÅ½â');
    set(gca,'XLim',[0 numIter+1],'YLim',[0 1.1*max([1 distHistory])]);
end

% Return Outputs
if nargout 
    varargout{1} = optRoute; 
    varargout{2} = optBreak;
    varargout{3} = minDist; 
end
% Generate Random Set of Breaks

function breaks = rand_breaks()
nSalesmen = ceil(floor(n/minTour)*rand); 
nBreaks = nSalesmen - 1; 
dof = n - minTour*nSalesmen; 
% degrees of freedom 
addto = ones(1,dof+1); 
for kk = 2:nBreaks
    addto = cumsum(addto);
end
cumProb = cumsum(addto)/sum(addto);
nAdjust = find(rand < cumProb,1)-1;
spaces = ceil(nBreaks*rand(1,nAdjust));
adjust = zeros(1,nBreaks); 
for kk = 1:nBreaks
    adjust(kk) = sum(spaces == kk);
end
breaks = minTour*(1:nBreaks) + cumsum(adjust);
end

end

