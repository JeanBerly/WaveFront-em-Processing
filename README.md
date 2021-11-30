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
    Nesta função o mapa é gerado e inicializado com valores de -1 e são sorteados os obstáculos e a posição do robô e destino garantindo que nenhum vá se sobrepor.
  <li>wavefront</li>
    Nesta função é procurado as posições do robô e destino, é aqui que as funções bfs e menorCaminho são chamadas.
  <li>Simulacao</li>
    É aqui que a função moverRobo é chamada.
  <li>bfs</li>
    A partir de uma coordenada x, y são analisados os 4 blocos adjacentes, preenchidos com o valor de (distância + 1) e adicionados a fila.
    Caso seja descoberto a posição destino a fila é limpa e será feito um return.
  <li>menorCaminho</li>
    A partir do destino é feito a procura do menor caminho procurando o bloco adjacente com menor valor.
  <li>moverRobo</li>
    É aqui que o robô irá percorrer o caminho até o destino.
</ol>
