public class Arco extends Oggetto
{
  private int weight;
  public Arco(color col_des,color col_sel)
  {
    super(col_des,col_sel);
    weight=4;
  };
  public void grassetto()
  {
    weight=6;
  }
  public void no_grassetto()
  {
    weight=4;
  }
}