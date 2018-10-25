class Scene {
    private ArrayList<Shape> shapes;
    
    public Scene() {};
    public Scene(ArrayList<Shape> shapes) {  
        this.shapes = shapes;
    }
    
    public Intersection intersects(Ray ray) {
        int len = shapes.size();
        Intersection[] intersections = new Intersection[len];
        
        for (int i = 0; i < len; i++) {
            intersections[i] = shapes.get(i).intersects(ray);
        }
      
        float highestDistance = (1<<30);
        Intersection r = new Intersection();
        
        for (int i = 0; i < len; i++) {
            if (intersections[i].hit && intersections[i].distance < highestDistance) {
                highestDistance = intersections[i].distance;
                r = intersections[i];
            }
        }
        
        return r;
    }
  
}
