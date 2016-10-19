import g4p_controls.*; //<>// //<>//
import java.awt.Font;

/*int[][] markov = {
  {60, 40}, //state 0 (total 100%)
  {95, 5}   //state 1 (total 100%)
};*/
       

int[][] markov = {
  {60, 25, 15}, //state 0 (total 100%)
  {25, 50, 25}, //state 1 (total 100%)
  {35, 25, 40}  //state 2 (total 100%)
};                 

int state = 0; //markov state

void setup()
{
  size(600,600);
  background(100);
}

color col_des=color(100,255,0);
color col_sel=color(100,255,0);
color col_fig_cont=color(255,0,100);
Nodo nodo=new Nodo(col_des,col_sel,col_fig_cont);

void draw()
{
  nodo.disegna(100,100,30,30);
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
      break;
    }
  }
  println("Current state: " + state);
}