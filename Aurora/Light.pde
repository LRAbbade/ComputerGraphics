interface Light {
    public PVector emission;
    
    public PVector evaluate(ShaderGlobals shaderGlobals);
    public float pdf(ShaderGlobals shaderGlobals);
    public PVector sample(ShaderGlobals shaderGlobals, PVector sample);
}
