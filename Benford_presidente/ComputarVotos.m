function ComputarVotos(CodEstado)

clc
close all

CodVotavel = [17;13;12;30;15;18;19;45;50;51;16;27;54;95;96];
NomeVotavel = ["JAIR BOLSONARO";"FERNANDO HADDAD";"CIRO GOMES";"JOAO AMOEDO";"HENRIQUE MEIRELLES";"MARINA SILVA";"ALVARO DIAS";"GERALDO ALCKMIN";"GUILHERME BOULOS";"CABO DACIOLO";"VERA";"EYMAEL";"JOAO GOULART FILHO";"Branco";"Nulo"];

BenfordStat = [0.301 0.176 0.125 0.097 0.079 0.067 0.058 0.051 0.046];

% Load file
string = sprintf('../dados_filtrados/filtro2_presidente/%s_filtro2_presidente.csv', CodEstado);
[NR_VOTAVEL,QT_VOTOS] = textread(string,'%d %d');

% Votos Totais e Total de Votos Validos
TotalVotos = sum(QT_VOTOS);
SelectedLines = find( NR_VOTAVEL < 90);
TotalValidos = sum( QT_VOTOS(SelectedLines) );

printf("\n======================================================================\n");
printf("Investigação independente e individual dos dados da\nEleição Ordinária Federal – 2018 – 1o Turno.\n\n");
printf("Método:  Verificação da naturalidade de geração dos dados\nusado a Lei de Benford (ou Newcomb-Benford).\n\n");
printf("Dados púbicos extraídos do TSE no dia 13-Outubro-2018.\n\n");
printf("Responsável: Dr. Francisco Amorim III.\n");
printf("             Doutor em Engenharia e Tecnologia Espaciais /\n");
printf("             Mecânica Espacial e Controle pelo\n");
printf("             Instituto Nacional de Pesquisas Espaciais (INPE)\n");
printf("=====================================================================\n\n");

printf("---------------------------------------------------------------------\n");
printf("COMPUTANDO OS DADOS DO ESTADO %s\n",CodEstado);
printf("Total de votos: [%d]\n",  TotalVotos);
printf("Total de votos válidos: [%d]\n\n",  TotalValidos);

% Contar votos por candidatos
for i=1:length(CodVotavel)
  SelectedLines = find( NR_VOTAVEL == CodVotavel(i));
  TotalCanditado = sum( QT_VOTOS(SelectedLines) );
  if CodVotavel(i) > 90
      printf("Votos em %s [%d], em %d urnas.\n",  NomeVotavel(i,:),TotalCanditado,length(SelectedLines));
  else
    printf("Votos em %s [%d], (%.2f%%) dos validos, em %d urnas.\n",NomeVotavel(i,:),TotalCanditado,TotalCanditado/TotalValidos*100,length(SelectedLines));
  end
    
end

% Plotar Benford por Votavel
h(10)=0;
for i=1:length(CodVotavel)
  h(i)=figure("position",get(0,"screensize")([3,4,3,4]).*[0.1 0.1 0.5 0.8]); 
  SelectedLines = find( NR_VOTAVEL == CodVotavel(i));
  VetorCanditado = QT_VOTOS(SelectedLines);
  [QtyOcorrencia, Percentual] = Benford(VetorCanditado); 
  PlotBenford(Percentual);
  string = sprintf('Estado %s - %d Urnas - Votos em %s ', CodEstado, length(SelectedLines), NomeVotavel(i,:));
  x = title (string);
  set (x,'fontsize', 20,'fontweight','bold');
end

% Plotar votos totais
h = figure("position",get(0,"screensize")([3,4,3,4]).*[0.1 0.1 0.5 0.8]);
[QtyOcorrencia, Percentual] = Benford(QT_VOTOS); 
PlotBenford(Percentual);
string = sprintf('Estado %s - Todos os votos', CodEstado);
h = title (string);
set (h,'fontsize', 20,'fontweight','bold');

printf("---------------------------------------------------------------------\n\n");
printf("Data e hora: %s\n",ctime (time ()));
