class Scene {
  public Scene() {};
  public Scene(ArrayList<Shape> shapes ) {  
  }
  
  public Intersection intersects(Ray ray) {
    Intersection intersection;
    
    //intersection.hit = false;
    //intersection.distance = Infinity;
    //intersection.object = null;
    
    //for object in scene{
    //  Intersection temp = object.intersects(ray);
    //  if (temp.hit && temp.distance < intersection.distance){
    //    intersection = temp
    //    intersection.object = object
    //  }
    //}
    return intersection;
  }
  
}
