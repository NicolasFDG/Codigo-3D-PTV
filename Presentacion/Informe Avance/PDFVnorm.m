function []=PDFVnorm(v,titulo)
v = (v-mean(v))./std(v) ;
figure;
nbin=size(v,1)/200;
limite=50;
ancho=2*limite/nbin;
bins=[-limite:ancho:limite];

ii=1;
[PDFV(:,ii), V(:,ii)] = hist(v(:,ii), bins) ;
DV    = diff(V(:,ii));
sv    = sum(DV.*PDFV(1:(end-1),ii));
PDFV(:,ii) = PDFV(:,ii)/sv;
h=semilogy(V(:,ii), PDFV(:,ii), 'square',...
    'MarkerEdgeColor',[255, 102, 0]/400,...
    'MarkerFaceColor',[255, 102, 0]/255,...
    'MarkerSize',10)
%,  'MarkerSize',5,'MarkerEdgeColor',[255, 102, 0]/400)
hold on
%[0, 114, 187]/187

% semilogy(VX, a1*exp(-((VX-b1)/c1).^2),'-','Color',[0, 114, 187]/187)
hold on

ii=2;
[PDFV(:,ii), V(:,ii)] = hist(v(:,ii), bins) ;
DV    = diff(V(:,ii));
sv    = sum(DV.*PDFV(1:(end-1),ii));
PDFV(:,ii) = PDFV(:,ii)/sv;
h=semilogy(V(:,ii), PDFV(:,ii),  'd',...
    'MarkerEdgeColor',[0, 114, 187]/300,...%255
    'MarkerFaceColor',[0, 114, 187]/187,...%187
    'MarkerSize',10)

ii=3;

[PDFV(:,ii), V(:,ii)] = hist(v(:,ii), bins) ;
DV    = diff(V(:,ii));
sv    = sum(DV.*PDFV(1:(end-1),ii));
PDFV(:,ii) = PDFV(:,ii)/sv;
h=semilogy(V(:,ii), PDFV(:,ii), 'o',...
    'MarkerEdgeColor',[0, 100, 0]/200,...
    'MarkerFaceColor',[0, 100, 0]/150,...
    'MarkerSize',10)
hold on

grid on
 title(titulo)
xlabel({'V'},'FontSize', 16)
ylabel({'PDF( V ) '},'FontSize', 16)
set(gca,'fontsize',16)

axis([-6 6 1E-3 1])
a1= 1/sqrt(2*pi);
    b1=0;
    c1=sqrt(2);
    semilogy(V(:,ii), a1*exp(-((V(:,ii)-b1)/c1).^2),'Color','k', 'LineWidth', 3)
    legend({'VX','VY', 'VZ', 'N(0,1)'}, 'FontSize', 16)
end
