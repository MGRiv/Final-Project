public abstract class Unit{
  private int health,damage;
  private boolean onPlayerTeam;
  public void attack(Unit other);
  public void turn();
  public void setHealth(int i);
  public int getHealth();
  public void setDamage(int i);
  public int getDamage();
}
