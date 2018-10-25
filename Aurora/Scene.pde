class Scene {
    private ArrayList<Shape> shapes;
    
    public Scene() {};
    public Scene(ArrayList<Shape> shapes) {  
        this.shapes = shapes;
    }
    
    public Intersection intersects(Ray ray) {
        Intersection r = new Intersection(false, (1<<30), 0);

        for (int i = 0; i < shapes.size(); i++) {
            Intersection aux = shapes.get(i).intersects(ray);

            if (aux.hit && aux.distance < r.distance) {
                r = aux;
            }
        }

        return r;
    }
  
}
