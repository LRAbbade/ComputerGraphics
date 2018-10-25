class Sphere implements Shape {
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
    public Intersection intersects(Ray ray) {}

    @Override
    public ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection) {}

    @Override
    public float surfaceArea() {}

    @Override
    public PVector evaluate(ShaderGlobals sg) {}
    
    @Override
    public float pdf(ShaderGlobals shaderglobals) {}
    
    public PVector sample(ShaderGlobals shaderglobals, PVector sample) {}
 
}
