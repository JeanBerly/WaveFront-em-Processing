import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;
int dimensoes = 15;
int num_obstaculos = 10;
int [][] grid = new int[dimensoes][dimensoes];
class coordenadas{
  int x;
  int y;
  coordenadas(int x1, int y1){
    x = x1;
    y = y1;
  }
}
void setup(){
  size(800,800);
  background(255);
  thread("Executa");
}
void Executa(){
  cria_mapa();
  wavefront(grid);
  Simulacao(grid);
  delay(500);
}
void draw(){
  background(255);
  // definindo o tamanho de cada quadrado
  int tam_quadrado = width/dimensoes;
  for (int i = 0; i < dimensoes; i++){
    for (int j = 0; j < dimensoes; j++){
      if (grid[i][j] == -1) fill (0, 0, 0);
      else if (grid[i][j] == 0) fill (255, 0, 0);
      else if (grid[i][j] == -2) fill (134, 30, 81);
      else if (grid[i][j] == -3) fill (0, 255, 0);
      else if (grid[i][j] == -4) fill (8, 7, 110);
      else if (grid[i][j] == -5) fill (44, 46, 45);
      else fill ((i + j)*10, (i + j)*15, (i + j)*20);
      rect(i* tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      if (grid[i][j] == -1){
        textAlign(CENTER, CENTER);
        textSize(14);
        fill (255, 255, 255);
        text("X", i*tam_quadrado, j*tam_quadrado, tam_quadrado, tam_quadrado);
      }
      else if (grid[i][j] == -2){
        textAlign(CENTER, CENTER);
        fill(0, 0, 0);
        text("ROBO", i*tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      }
      else if (grid[i][j] == -3){
        textAlign(CENTER, CENTER);
        textSize(18);
        fill(0, 0, 0);
        text("DESTINO", i*tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      }
      else if (grid[i][j] == 0){
        textAlign(CENTER, CENTER);
        textSize(14);
        fill(0, 0, 0);
        text("OBSTÁCULO", i*tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      }
      else if (grid[i][j] == -4){
        textAlign(CENTER, CENTER);
        textSize(14);
        fill(46, 255, 119);
        text("--", i*tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      }
      else if (grid[i][j] == -5){
        textAlign(CENTER, CENTER);
        textSize(14);
        fill(255, 255, 255);
        text("--", i*tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      }
      else{
        String bloh = "" + grid[i][j];
        textAlign(CENTER, CENTER);
        textSize(20);
        fill (0, 0, 0);
        text(bloh, i*tam_quadrado, j * tam_quadrado, tam_quadrado, tam_quadrado);
      }
    }
  }
}
void cria_mapa(){
  for (int i = 0; i < dimensoes; i++){
    for (int j = 0; j < dimensoes; j++){
      grid[i][j] = -1;
      delay(3);
    }
  }
  for (int i = 0; i <= (num_obstaculos + 2); i++){
    int l = (int)random(dimensoes);
    int c = (int)random(dimensoes);
    if (i >= num_obstaculos){
      if (i == num_obstaculos){
        if (grid[l][c] != -1){
          do{
            l = (int)random(dimensoes);
            c = (int)random(dimensoes);
          }while(grid[l][c] != -1);
        }
        grid[l][c] = -2;
      }
      if (i == (num_obstaculos + 1)){
        if (grid[l][c] != -1){
          do{
            l = (int)random(dimensoes);
            c = (int)random(dimensoes);
          }while(grid[l][c] != -1);
        }
        grid[l][c] = -3;
      }
    }
    else{
      if (grid[l][c] != -1){
        do{
          l = (int)random(dimensoes);
          c = (int)random(dimensoes);
        }while(grid[l][c] != -1);
      }
      grid[l][c] = 0;
    }
    delay(50);
  }
}
void wavefront(int[][] grid){
  coordenadas destino = new coordenadas(0, 0);
  coordenadas robo = new coordenadas (0, 0);
  for (int i = 0; i < dimensoes; i++){
    for (int j = 0; j < dimensoes; j++){
      if (grid[i][j] == -2){
        robo.x = i;
        robo.y = j;
      }
      if (grid[i][j] == -3){
        destino.x = i;
        destino.y = j;
      }
    }
  }
  Queue<coordenadas> fila = new LinkedList<>();
  coordenadas b = new coordenadas(robo.x, robo.y);
  fila.add(b);
  while (fila.size() > 0){
    b = fila.peek();
    fila = bfs(b.x, b.y, grid, fila);
    if (fila.size() > 0){
      fila.remove();
    }
  }
  menorCaminho(destino, grid);
}
void Simulacao(int[][]grid){
  coordenadas robo = new coordenadas(0, 0);
  for (int i = 0; i < dimensoes; i++){
    for (int j = 0; j < dimensoes; j++){
      if (grid[i][j] == -2){
        robo.x = i;
        robo.y = j;
      }
    }
  }
  moverRobo(robo, grid);
}
Queue bfs(int x, int y, int[][] grid, Queue fila){
  // se for destino então fila.clear e break;
  if ((x+1) < dimensoes){
    if (grid[x+1][y] == -1){
      if (grid[x][y] == -2) grid[x+1][y] = 1;
      else grid[x+1][y] = grid[x][y] + 1;
      coordenadas a = new coordenadas(x+1, y);
      fila.add(a);
    }
    else if (grid[x+1][y] == -3){
      fila.clear();
      return fila;
    }
  }
  if ((x-1) >= 0){
    if (grid[x-1][y] == -1){
      if (grid[x][y] == -2) grid[x-1][y] = 1;
      else grid[x-1][y] = grid[x][y] + 1;
      coordenadas b = new coordenadas(x-1, y);
      fila.add(b);
    }
    else if (grid[x-1][y] == -3){
      fila.clear();
      return fila;
    }
  }
  if ((y+1) < dimensoes){
    if (grid[x][y+1] == -1){
      if (grid[x][y] == -2) grid[x][y+1] = 1;
      else grid[x][y+1] = grid[x][y] + 1;
      coordenadas c  = new coordenadas(x, y+1);
      fila.add(c);
    }
    else if (grid[x][y+1] == -3){
      fila.clear();     
      return fila;
    }
  }
  if ((y-1) >= 0){
    if (grid[x][y-1] == -1){
      if (grid[x][y] == -2) grid[x][y-1] = 1;
      else grid[x][y-1] = grid[x][y] + 1;
      coordenadas d = new coordenadas(x, y-1);
      fila.add(d);
    }
    else if (grid[x][y-1] == -3){
      fila.clear();
      return fila;
    }
  }
  delay(50);
  return fila;
}
void menorCaminho (coordenadas origem, int[][]grid){
    int menor = 999;
    coordenadas posicaoAtual = new coordenadas(origem.x, origem.y);
    coordenadas proximo = new coordenadas(origem.x, origem.y);
    do{
      delay(500);
      if ((posicaoAtual.x + 1) < dimensoes && grid[posicaoAtual.x + 1][posicaoAtual.y] < menor && (grid[posicaoAtual.x + 1][posicaoAtual.y] > 0 || grid[posicaoAtual.x + 1][posicaoAtual.y] == -2)){
        if (grid[posicaoAtual.x + 1][posicaoAtual.y] == -2){
          break;
        }
        menor = grid[posicaoAtual.x + 1][posicaoAtual.y];
        proximo.x = (posicaoAtual.x) + 1;
        proximo.y = posicaoAtual.y;
      }
      if ((posicaoAtual.x - 1) >= 0 && grid[posicaoAtual.x - 1][posicaoAtual.y] < menor && (grid[posicaoAtual.x - 1][posicaoAtual.y] > 0 || grid[posicaoAtual.x - 1][posicaoAtual.y] == -2)){
        if (grid[posicaoAtual.x - 1][posicaoAtual.y] == -2){
          break;
        }
        menor = grid[posicaoAtual.x - 1][posicaoAtual.y];
        proximo.x = (posicaoAtual.x) - 1;
        proximo.y = posicaoAtual.y;
      }
      if ((posicaoAtual.y + 1) < dimensoes && grid[posicaoAtual.x][posicaoAtual.y + 1] < menor && (grid[posicaoAtual.x][posicaoAtual.y + 1] > 0 || grid[posicaoAtual.x][posicaoAtual.y + 1] == -2)){
        if (grid[posicaoAtual.x][posicaoAtual.y + 1] == -2){
          break;
        }
        menor = grid[posicaoAtual.x][posicaoAtual.y + 1];
        proximo.x = posicaoAtual.x;
        proximo.y = (posicaoAtual.y) + 1;
      }
      if ((posicaoAtual.y - 1) >= 0 && grid[posicaoAtual.x][posicaoAtual.y - 1] < menor && (grid[posicaoAtual.x][posicaoAtual.y - 1] > 0 || grid[posicaoAtual.x][posicaoAtual.y - 1] == -2)){
        if (grid[posicaoAtual.x][posicaoAtual.y - 1] == -2){
          break;
        }
        menor = grid[posicaoAtual.x][posicaoAtual.y - 1];
        proximo.x = posicaoAtual.x;
        proximo.y = (posicaoAtual.y) - 1;
      }
       grid[proximo.x][proximo.y] = -4;
       posicaoAtual.x = proximo.x;
       posicaoAtual.y = proximo.y;
    }while(grid[proximo.x][proximo.y] != -2 && (proximo.x != origem.x || proximo.y != origem.y));
}

void moverRobo(coordenadas posicaoAtual, int[][] grid){
  boolean fim_caminho = false;
  while (fim_caminho == false){
    if ((posicaoAtual.x + 1) < dimensoes && (grid[posicaoAtual.x + 1][posicaoAtual.y] == -4 || grid[posicaoAtual.x+1][posicaoAtual.y] == -3)){
      grid[posicaoAtual.x][posicaoAtual.y] = -5;
      posicaoAtual.x++;
    }
    else if ((posicaoAtual.x - 1) >= 0 && (grid[posicaoAtual.x - 1][posicaoAtual.y] == -4 || grid[posicaoAtual.x - 1][posicaoAtual.y] == -3)){
      grid[posicaoAtual.x][posicaoAtual.y] = -5;
      posicaoAtual.x--;
    }
    else if ((posicaoAtual.y + 1) < dimensoes && (grid[posicaoAtual.x][posicaoAtual.y + 1] == -4 || grid[posicaoAtual.x][posicaoAtual.y + 1] == -3)){
      grid[posicaoAtual.x][posicaoAtual.y] = -5;
      posicaoAtual.y++;
    }
    else if ((posicaoAtual.y - 1) >= 0 && (grid[posicaoAtual.x][posicaoAtual.y - 1] == -4 || grid[posicaoAtual.x][posicaoAtual.y - 1] == -3)){
      grid[posicaoAtual.x][posicaoAtual.y] = -5;
      posicaoAtual.y--;
    }    
    else fim_caminho = true;
    grid[posicaoAtual.x][posicaoAtual.y] = -2;
    delay(500);
  }
}
