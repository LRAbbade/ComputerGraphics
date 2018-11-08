class Renderer {
    public RenderOptions options;
    public Camera camera;
    public Scene scene;
    
    public Renderer() {}

    public Renderer(RenderOptions options, Camera camera, Scene scene) {
        this.options = options;
        this.camera = camera;
        this.scene = scene;
    }

    public PVector computeDirectIllumination(BSDF bsdf, ShaderGlobals shaderGlobals) {
        // TODO
    }

    public PVector computeIndirectIllumination(BSDF bsdf, ShaderGlobals shaderGlobals) {
        // TODO
    }

    public PVector trace(Ray ray, int depth) {
        // TODO
    }

    public PImage render() {
        // TODO
    }

}
