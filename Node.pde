public abstract class Node {

    Pos pos;
    int val, nWidth, nHeight;
    boolean selectC, selectL, selectR;
    Node parent, left, right;
    String vname;

    public abstract int calc();

    public void draw() {
        // ノード本体
        fill(255);
        strokeWeight(2);
        rect(pos.x, pos.y, 200, 100);

        // 連結選択(上)
        if(selectC)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+100, pos.y, 10, 10);

        // 連結選択(左)
        if(selectL)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+200/3, pos.y+100, 10, 10);

        // 連結選択(右)
        if(selectR)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+200/3*2, pos.y+100, 10, 10);

        // 連結線
        strokeWeight(1);
        if(left != null)
            line(pos.x+200/3, pos.y+100, left.getTopPos().x, left.getTopPos().y);
        if(right != null)
            line(pos.x+200/3*2, pos.y+100, right.getTopPos().x, right.getTopPos().y);

        // NODE NAME
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(32);
        text(vname, pos.x+100, pos.y+50);
        textAlign(LEFT, LEFT);
    }

    public Pos getPos() {
        return this.pos;
    }

    public Pos getTopPos() {
        return new Pos(this.pos.x+nWidth/2, this.pos.y);
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

    public void setParent(Node parent){
        this.parent = parent;
    }

    public void setLeft(Node left) {
        if(left != this)
            this.left = left;
    }

    public void setRight(Node right) {
        if(right != this)
            this.right = right;
    }

    public int click(int x, int y) {
        checkSelectC(x, y);
        checkSelectL(x, y);
        checkSelectR(x, y);

        int a = this.selectC ? 1 : 0;
        int b = this.selectL ? 1 : 0;
        int c = this.selectR ? 1 : 0;
        int d = (pos.x <= x && x <= pos.x+nWidth) && (pos.y <= y && y <= pos.y+nHeight) ? 1 : 0;
        return a*8 | b*4 | c*2 | d;
    }

    public void release() {
        this.selectC = false;
        this.selectL = false;
        this.selectR = false;
    }

    public void reset(int cnt) {
        this.val = 0;
        this.left = null;
        this.right = null;
        if(this.parent != null && cnt > 0)
            this.parent.reset(cnt-1);
    }

    private void checkSelectC(int x, int y) {
        int cx = pos.x + nWidth/2;
        int cy = pos.y;
        this.selectC = sqrt(sq(x-cx) + sq(y-cy)) <= 5;
    }

    private void checkSelectL(int x, int y) {
        int lcx = pos.x + nWidth/3;
        int lcy = pos.y + nHeight;
        this.selectL = sqrt(sq(x-lcx) + sq(y-lcy)) <= 5;
    }

    private void checkSelectR(int x, int y) {
        int rcx = pos.x + nWidth/3*2;
        int rcy = pos.y + nHeight;
        this.selectR = sqrt(sq(x-rcx) + sq(y-rcy)) <= 5;
    }

}
