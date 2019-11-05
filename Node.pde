public abstract class Node {

    Pos pos;
    int val, nWidth, nHeight;
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

    public void setVal(int val) {
        this.val = val;
    }

    public void setLeft(Node left) {
        this.left = left;
    }

    public void setRight(Node right) {
        this.right = right;
    }

    public boolean checkHit(int x, int y) {
        return (pos.x <= x && x <= pos.x+nWidth) && (pos.y <= y && y <= pos.y+nHeight);
    }

    public void reset() {
        this.val = 0;
        this.pos = null;
        this.left = null;
        this.right = null;
    }

}
