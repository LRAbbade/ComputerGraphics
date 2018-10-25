class Sphere{
  public PVector position;
  public float radius;
  
  public Sphere(){};
  public Sphere(PVector position, float radius, boolean explicityLight,PVector emission){
    this.position = position;
    this.radius = radius;
  }
}
