class Sphere extends Shape {
    public PVector position;
    public float radius;

    public Sphere() {}
    
    public Sphere(PVector position, float radius, boolean explicitLight, PVector emission){
        this.position = position;
        this.radius = radius;
        this.explicitLight = explicitLight;
        this.emission = emission;
    }
    
    @Override
    public Intersection intersects(Ray ray) {
       float a = 1;
       PVector o_menos_c = ray.origin.sub(position);
       float b = ray.direction.mult(2).cross(o_menos_c).mag();
       float c = (o_menos_c.mag() * o_menos_c.mag()) - (radius * radius);
       
       float[] raizes;
       
       try {
           raizes = bhaskara(a, b, c);
       } catch (Exception e) {
           return new Intersection(false, 0, 0);
       }
       
       float t0 = raizes[0];
       float t1 = raizes[1];
       
       PVector r0 = ray.intersectionPoint(t0);
       PVector r1 = ray.intersectionPoint(t1);
       
       float dist1 = r0.sub(ray.origin).mag();
       float dist2 = r1.sub(ray.origin).mag();
       
       return new Intersection(true, Math.min(dist1, dist2), 0);    // nao sei q q eh o index
    }
    
    private float getDelta(float a, float b, float c) {
        return b*b - 4*a*c;
    }
    
    private float[] bhaskara(float a, float b, float c) {
        float delta = getDelta(a, b, c);
        float x1 = (float)(-b + Math.sqrt(delta))/2*a;
        float x2 = (float)(-b - Math.sqrt(delta))/2*a;
        float[] r = {x1, x2};
        return r;
    }

    @Override
    public ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection) {
        return new ShaderGlobals();
    }

    @Override
    public float surfaceArea() {
        return 0;
    }

    @Override
    public PVector evaluate(ShaderGlobals sg) {
        return new PVector();
    }
    
    @Override
    public float pdf(ShaderGlobals shaderglobals) {
        return 0;
    }
    
    @Override
    public PVector sample(ShaderGlobals shaderglobals, PVector sample) {
        return new PVector();
    }

}
