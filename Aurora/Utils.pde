class Utils {

    public static PVector[] stratifiedSample(int samples) {
        int size = sqrt(samples);
        PVector[] points = new PVector[samples];

        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {

                points[i*size + j] = PVector.add(uniformRandom2D(), 
                                                 new PVector(i, j)).div(size);
            }
        }

        return points;
    }

    private float uniformRandom1D() {
        return random(1.0);
    }

    private PVector uniformRandom2D() {
        return new PVector(uniformRandom1D(), uniformRandom1D());
    }

    public static float gaussian1D(float sample, float width) {
        float radius = width * 0.5;
        return max(0, exp(-sample * sample) - exp(-radius * radius));
    }

    public static float gaussian2D(PVector sample, float width) {
        return gaussian1D(sample.x, width) * gaussian1D(sample.y, width);
    }

    public static PVector saturate(PVector colour) {
        return new PVector(constrain(colour.x, 0, 1.0), 
                           constrain(colour.y, 0, 1.0), 
                           constrain(colour.z, 0, 1.0));
    }

    public static PVector gamma(PVector colour, float value) {
        float t = 1.0/value;
        return new PVector(pow(colour.x, t), pow(colour.y, t), pow(colour.z, t));
    }

    public static PVector exposure(PVector colour, float value) {
        float t = pow(2.0, value);
        return new PVector(colour.x * t, colour.y * t, colour.z * t);
    }

}
