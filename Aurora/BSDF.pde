interface BSDF extends Shape {
   public PVector evaluate(ShaderGlobals shaderGlobals);
   public float pdf(ShaderGlobals shaderGlobals);
   public PVector sample(ShaderGlobals shaderGlobals, PVector sample);
}
