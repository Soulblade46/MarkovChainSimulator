import g4p_controls.*; //<>// //<>//
import java.awt.Font;

int N=3;
final int prob_tot=100;

/*int[][] markov = {
  {60, 40}, //state 0 (total 100%)
  {95, 5}   //state 1 (total 100%)
};*/
       

/*int[][] markov = {
  {60, 25, 15}, //state 0 (total 100%)
  {25, 50, 25}, //state 1 (total 100%)
  {35, 25, 40}  //state 2 (total 100%)
};*/

IntList[] markov;

int[] stat;

int state = 0; //markov state
Nodo[] nodo;

void setup()
{
  size(600,600);
  background(100);
  createGUI();
  nodo=new Nodo[N];
  stat=new int[N];
  markov=new IntList[N];
  for (int i=0;i<markov.length;i++)
  {
    markov[i]=new IntList();
  }
  
  for (int i=0;i<nodo.length;i++)
  nodo[i]=new Nodo(col_des,col_sel,col_fig_cont); 
  /*for (int i=0;i<markov[0].size;i++)
  {
    for (int j=0;j<markov[0].length;j++)
    {
      markov[i][j]=prob_tot/N;
    }
  }*/
  
  for (int i = 0; i < markov.length; i++) 
  {
    for (int j=0; j < N ; j++)
     markov[i].append(prob_tot/N);
     //markov[j].append(prob_tot/N);
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
  //changeMarkovState();//commentato da me
  //aggiungi_nodo();//aggiunto da me
}


/*void changeMarkovState() {
  //float rnd = random(100.0); //rnd 100 for a 100% range//commentato da me
  float rnd = random((float)prob_tot);//aggiunto da me
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
    //refresh_tabella(markov);
  }
  //println("Current state: " + state);//commentato da me
  println("Stat: nodo 0= "+stat[0]+" Stat: nodo 1= "+stat[1]+" Stat: nodo 2= "+stat[2]);//aggiunto da me
}*/


void changeMarkovState()
{
  //float rnd = random(100.0); //rnd 100 for a 100% range//commentato da me
  float rnd = random((float)prob_tot);//aggiunto da me
  float range = 0;
  
  for(int i = 0; i < markov[0].size(); i++) {
    range += float(markov[state].get(i));
    if(rnd <= range) {
      state = i; //set the new state
      deseleziona_tutti(nodo);//aggiunto da me
      nodo[i].seleziona();//aggiunto da me
      stat[i]++;//aggiunto da me
      break;
    }
    //refresh_tabella(markov);
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
  nodo[i].disegna((width/2)-50+i*50,(height/2),30,30);
}

/*void aggiungi_nodo()
{
  N++;
  int[][] nuovo=new int[1][N];
  for (int i=0;i<nodo.length;i++)
    nuovo[0][i]=prob_tot/N;
  nodo=(Nodo[])append(nodo,new Nodo(col_des,col_sel,col_fig_cont));
  markov=(int[][])append(markov,nuovo);
  refresh_tabella(markov);
}*/

void refresh_tabella(int[][] tabella)
{
  for (int i=0;i<tabella[0].length;i++)
  {  
    for (int j=0;j<tabella[0].length;j++)
    {
      tabella[i][j]=prob_tot/N;
    }
  }
}