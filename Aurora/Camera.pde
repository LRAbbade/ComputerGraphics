class Camera {
    public float fieldOfView;
    public Film film;
    public PMatrix3D worldMatrix;

    public Camera() {}

    public Camera(float fieldOfView, Film film, PMatrix3D worldMatrix) {
        this.fieldOfView = fieldOfView;
        this.film = film;
        this.worldMatrix = worldMatrix;
    }

    public void lookAt(PVector position, PVector target, PVector up) {
        PVector p_menos_f = position.sub(target);
        PVector w = p_menos_f.div(p_menos_f.mag());
        PVector up_cross_w = up.cross(w);
        PVector u = up_cross_w.div(up_cross_w.mag());
        PVector v = w.cross(u);

        worldMatrix = new PMatrix3D(u.x, v.x, w.x, position.x,
                                    u.y, v.y, w.y, position.y,
                                    u.z, v.z, w.z, position.z,
                                    0, 0, 0, 1);
    }

    public void transform(PMatrix3D transformation) {
        worldMatrix.apply(transformation);
    }

    public Ray generateRay(float x, float y, PVector sample) {
        float xc = film.aspectRatio() * (fieldOfView / 2) * x;
        float yc = (fieldOfView / 2) * y;

        PVector p = new PVector(xc, yc, -1);    
        PVector pl = new PVector(1, 1, 1);
        pl = worldMatrix.mult(p, pl); 

        PVector d = PVector.sub(pl, sample).normalize();

        return new Ray(p, d);
    }

}
