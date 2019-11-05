import g4p_controls.*;
import java.util.HashMap;

static final int NCENTER = 8;
static final int NLEFT = 4;
static final int NRIGHT = 2;
static final int NBODY = 1;

int holdNodeID, oldMouseX, oldMouseY, oldPressNodePl, oldPressNodeID;
HashMap<Integer, Node> nodeMap;

void setup() {
    frameRate(25);
    size(1200, 800);

    holdNodeID = -1;
    nodeMap = new HashMap<Integer, Node>();
    RootNode rnode = new RootNode();
    rnode.setPos(350, 100);
    nodeMap.put(0, rnode);

    GButton add = new GButton(this, 850, 50, 130, 100, "ADD");
    GButton sub = new GButton(this, 1020, 50, 130, 100, "SUB");
    GButton mul = new GButton(this, 850, 170, 130, 100, "MUL");
    GButton div = new GButton(this, 1020, 170, 130, 100, "DIV");
    GButton num = new GButton(this, 850, 290, 130, 100, "NUM");
    add.tag = "ADD";
    sub.tag = "SUB";
    mul.tag = "MUL";
    div.tag = "DIV";
    num.tag = "NUM";
}

void draw() {
    background(255);

    // パレット
    fill(255);
    strokeWeight(3);
    rect(820, 20, 360, 760);

    // ノード
    for(int key : nodeMap.keySet())
        nodeMap.get(key).draw();
}

/* mouse_func.pde */

/* node_func.pde */
