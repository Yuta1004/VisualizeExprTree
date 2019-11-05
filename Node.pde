public abstract class Node {

    int x, y, val;
    private Node left, right;

    public abstract void draw();
    public abstract int calc();

    public void setPos(int x, int y) {
        this.x = x;
        this.y = y;
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

    public void reset() {
        this.x = 0;
        this.y = 0;
        this.val = 0;
        this.left = null;
        this.right = null;
    }

}
