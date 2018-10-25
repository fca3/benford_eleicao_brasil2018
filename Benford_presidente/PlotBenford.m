function PlotBenford(Vector)

BenfordStat = [0.301 0.176 0.125 0.097 0.079 0.067 0.058 0.051 0.046]*100;
Vector = Vector*100;


fig = gca ();
std_fontsize = 20;

plot(BenfordStat,'-bd;Distribuição de Benford (Referência);','linewidth', 3,'markersize', 13);
hold on
grid on
xlabel ('Distribuição do Primeiro dígito da quantidade de votos em cada Boletim de Urna','fontsize', std_fontsize);
ylabel ('Frequência','fontsize', std_fontsize);

set(fig, 'linewidth', 1, 'fontsize', std_fontsize);
set(fig,'XTick',1:9, 'fontsize', std_fontsize);
set(fig,'YTick',0:5:100, 'fontsize', std_fontsize);

for i=1:9
  string = sprintf('%0.1f%%', BenfordStat(i));
  h = text (i-0.6, BenfordStat(i)-1, string);
  set (h, 'color','b','fontsize', std_fontsize);
end

plot(Vector,'-r*;Distribuição dos votos apurados;','linewidth', 3, 'markersize', 13);
for i=1:9
  string = sprintf('%0.1f%%', Vector(i));
  h = text (i+0.1, Vector(i)+0.5, string);
  set (h, 'color','r','fontsize', std_fontsize);
end
h = legend ('Show');
set (h, 'fontsize', std_fontsize)

h = text (0.1, 3.5, 'Realizado por:');
set (h, 'color','k','fontsize', std_fontsize-1,'fontweight','bold');
h = text (0.1, 1.5, 'Dr. Francisco Amorim III');
set (h, 'color','k','fontsize', std_fontsize-1,'fontweight','bold');
  
hold off

end