interface BSDF extends Shape {
  public PVector evaluate(ShaderGlobals shaderGlobals) {
      return new PVector();
  }
  
  public float pdf(ShaderGlobals shaderGlobals) {
    return 0;
  }
  
  public PVector sample(ShaderGlobals shaderGlobals, PVector sample) {
    return new PVector();
  }

}
