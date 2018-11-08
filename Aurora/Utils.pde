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

}
