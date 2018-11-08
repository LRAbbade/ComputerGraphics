import java.utils.random;

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

    private PVector uniformRandom2D() {
        Random random = new Random();
        return new PVector(random.nextFloat() - 0.5, random.nextFloat() - 0.5, 0);
    }

    public static float gaussian1D(float sample, float width) {
        float radius = width * 0.5;
        return max(0, exp(-sample * sample) - exp(-radius * radius));
    }

    public static float gaussian2D(PVector sample, float width) {
        return gaussian1D(sample.x, width) * gaussian1D(sample.y, width);
    }

    public static PVector saturate(PVector color) {
        return new PVector(constrain(color.x, 0, 1.0), 
                           constrain(color.y, 0, 1.0), 
                           constrain(color.z, 0, 1.0));
    }

    public static PVector gamma(PVector color, float value) {
        float t = 1.0/value;
        return new PVector(pow(color.x, t), pow(color.y, t), pow(color.z, t));
    }

    public static PVector exposure(PVector color, float value) {
        float t = pow(2.0, value);
        return new PVector(color.x * t, color.y * t, color.z * t);
    }

}
