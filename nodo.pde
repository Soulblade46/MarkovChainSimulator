public class Nodo extends Figura
{
  public Nodo(color col_des,color col_sel,color col_fig_cont)
  {
    super(col_des,col_sel,col_fig_cont);
  };
  public void disegna(int x,int y,int lung,int alt)
  {
    super.disegna();
    fill(get_colore());
    ellipseMode(CENTER);
    ellipse(x,y,lung,alt);
  }
}