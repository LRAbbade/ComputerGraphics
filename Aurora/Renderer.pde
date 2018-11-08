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
        Intersection intersection = scene.intersects(ray);
        return intersection.hit ? new PVector(1.0, 1.0, 1.0) : new PVector(0, 0, 0);
    }

    public PImage render() {
        PImage image = createImage(width, height);
        
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height, j++) {
                PVector[] samples = Utils.stratifiedSample(options.cameraSamples);
                
                PVector pColor = new PVector(0, 0, 0);
                float totalWeight = 0;
                
                for (int k = 0; k < options.cameraSamples; k++) {
                    PVector sample = PVector.sub(samples[k], new PVector(0.5, 0.5)).mult(options.filterWidth);
                    Ray ray = camera.generateRay(i, j, sample);
                    float weight = Utils.gaussian2D(sample, options.filterWidth);
                    
                    pColor.add(PVector.mult(trace(ray, 0), weight));
                    totalWeight += weight;
                }
                
                pColor.div(totalWeight);
                pColor = saturate(gamma(exposure(pColor, gammaValue)));
            }
        }
        
        return image;
    }

}
