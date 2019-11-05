public abstract class Node {

    Pos pos;
    int val, nWidth, nHeight;
    boolean selectC, selectL, selectR;
    private Node left, right;

    public abstract void draw();
    public abstract int calc();

    public Pos getPos() {
        return this.pos;
    }

    public void setPos(Pos pos) {
        this.pos = pos;
    }

    public void setPos(int x, int y) {
        this.pos = new Pos(x, y);
    }

    public void movePos(int dx, int dy) {
        this.pos.x += dx;
        this.pos.y += dy;
    }

    public void setVal(int val) {
        this.val = val;
    }

    public void setLeft(Node left) {
        this.left = left;
    }

    public void setRight(Node right) {
        this.right = right;
    }

    public boolean click(int x, int y) {
        checkSelectC(x, y);
        checkSelectL(x, y);
        checkSelectR(x, y);
        return (pos.x <= x && x <= pos.x+nWidth) && (pos.y <= y && y <= pos.y+nHeight)
                || this.selectC || this.selectL || this.selectR;
    }

    public void release() {
        this.selectC = false;
        this.selectL = false;
        this.selectR = false;
    }

    public void reset() {
        this.val = 0;
        this.pos = null;
        this.left = null;
        this.right = null;
    }

    private void checkSelectC(int x, int y) {
        int cx = pos.x + nWidth/2;
        int cy = pos.y;
        this.selectC = abs(sq(x-cx) + sq(y-cy)) <= 5;
    }

    private void checkSelectL(int x, int y) {
        int lcx = pos.x + nWidth/3;
        int lcy = pos.y + nHeight;
        this.selectL = abs(sq(x-lcx) + sq(y-lcy)) <= 5;
    }

    private void checkSelectR(int x, int y) {
        int rcx = pos.x + nWidth/3*2;
        int rcy = pos.y + nHeight;
        this.selectL = abs(sq(x-rcx) + sq(y-rcy)) <= 5;
    }

}
