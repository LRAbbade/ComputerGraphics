interface Shape extends Light {
    public boolean explicitLight;
    
    public Intersection intersects(Ray ray);
    public ShaderGlobals calculateShaderGlobals(Ray ray, Intersection intersection);
    public float surfaceArea();
}
