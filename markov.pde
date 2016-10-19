import g4p_controls.*; //<>// //<>//
import java.awt.Font;

final int N=3;

/*int[][] markov = {
  {60, 40}, //state 0 (total 100%)
  {95, 5}   //state 1 (total 100%)
};*/
       

/*int[][] markov = {
  {60, 25, 15}, //state 0 (total 100%)
  {25, 50, 25}, //state 1 (total 100%)
  {35, 25, 40}  //state 2 (total 100%)
};*/

int[][] markov;

int[] stat;

int state = 0; //markov state
Nodo[] nodo;

void setup()
{
  size(600,600);
  background(100);
  createGUI();
  nodo=new Nodo[N];
  markov=new int[N][N];
  stat=new int[N];
  for (int i=0;i<nodo.length;i++)
  nodo[i]=new Nodo(col_des,col_sel,col_fig_cont); 
  for (int i=0;i<markov[0].length;i++)
  {
    for (int j=0;j<markov[0].length;j++)
    {
      markov[i][j]=33;
    }
  }
  tmr.start();
}

color col_des=color(100,255,0);
color col_sel=color(255,255,0);
color col_fig_cont=color(255,0,100);


void draw()
{
  disegna();
}


void mousePressed() {
  changeMarkovState();
}


void changeMarkovState() {
  float rnd = random(100.0); //rnd 100 for a 100% range
  float range = 0;
  

  for(int i = 0; i < markov[0].length; i++) {
    range += float(markov[state][i]);
    if(rnd <= range) {
      state = i; //set the new state
      deseleziona_tutti(nodo);//aggiunto da me
      nodo[i].seleziona();//aggiunto da me
      stat[i]++;//aggiunto da me
      break;
    }
  }
  //println("Current state: " + state);//commentato da me
  println("Stat: nodo 0= "+stat[0]+" Stat: nodo 1= "+stat[1]+" Stat: nodo 2= "+stat[2]);//aggiunto da me
}

void deseleziona_tutti(Oggetto[] ogg)
{
  for (int i=0;i<nodo.length;i++)
  ogg[i].deseleziona();
}
void disegna()
{
  for (int i=0;i<nodo.length;i++)
  nodo[i].disegna(100+i*50,100,30,30);
}