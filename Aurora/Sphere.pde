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
       PVector o_menos_c = PVector.sub(ray.origin, position);
       float b = PVector.mult(ray.direction, 2).dot(o_menos_c);
       float c = o_menos_c.magSq() - (radius * radius);
       
       print("b = " + b + "\n");
       print("c = " + c + "\n");
       
       float[] raizes;
       
       try {
           raizes = bhaskara(a, b, c);
       } catch (Exception e) {
           return new Intersection(false, 0, 0);
       }
       
       float t0 = raizes[0];
       float t1 = raizes[1];
       print("t0 = " + t0 + "\n");
       print("t1 = " + t1 + "\n");
       int inf = (1<<30);
       
       float t = Math.min(t0 >= 0 ? t0 : inf, t1 >= 0 ? t1 : inf);
       if (t == inf) return new Intersection(false, 0, 0); 

       return new Intersection(true, t, -1);
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
