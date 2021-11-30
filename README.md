<h1>WaveFront-in-Processing</h1>
<h2>Status: Finalizado✔️<h2>
<h3>É um programa em Processing no qual é utilizado o algoritmo WaveFront para descobrir o menor caminho entre um robô e seu destino</h4>
<h3> Como abrir o programa </h3>
  Para abrir o programa é necessário fazer o download do Processing no seguinte link: <a href="https://processing.org/tutorials/gettingstarted">Processing</a>
<ul>
  <li>Execute o processing.exe</li>
  <li>No canto superior esquerdo clique em File</li>
  <li>Clique em Open</li>
  <li>Selecione o arquivo WaveFront.pde e abra</li>
  <li> Clique no ícone ▶️ para executar</li>
</ul>
<h3> Como aumentar o número de obstáculos ou o tamanho da matriz</h3>
  Caso queira aumentar o tamanho da matriz altere a variável dimensoes.<br>
  Caso queira alterar o número de obstáculos altere a variável num_obstaculos.
<h4> Funções no Programa </h4>
<ol>
  <li>Draw</li>
    Nesta função é onde o desenho da matriz na tela é feita.
    Legenda dos valores na matriz e seus significados:
  <ul>
    <li>-5: Destino já percorrido</li>
    <li>-4: Destino a ser percorrido</li>
    <li>-3: Destino</li>
    <li>-2: Robô</li>
    <li>-1: Espaço livre porém não mapeado</li>
    <li> 0: Obstáculo</li>
  </ul>
  Foram utilizados valores negativos, já que os positivos representam a distância do bloco do robô.
  <li>cria_mapa</li>
  <li>wavefront</li>
  <li>Simulacao</li>
  <li>bfs</li>
  <li>menorCaminho</li>
  <li>moverRobo</li>  
</ol>
