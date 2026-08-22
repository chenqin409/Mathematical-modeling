s = [9 9 1 1 2 2 2 7 7 6 6  5  5 4];
t = [1 7 7 2 8 3 5 8 6 8 5  3  4 3];
w = [4 8 3 8 2 7 4 1 6 6 2 14 10 9];
G = graph(s,t,w);
plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2)
set(gca,'XTick',[],'YTick',[])

[P,d] = shortestpath(G,9,4); %9->4最短路径
myplot = plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2);
highlight(myplot,P,'EdgeColor','black')

D = distances(G)
D(1,2)
[nodelDS,dist] = nearest(G,2,10) %到2距离小于10的点