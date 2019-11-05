import java.util.HashMap;

static final int NCENTER = 8;
static final int NLEFT = 4;
static final int NRIGHT = 2;
static final int NBODY = 1;

int holdNodeID, oldMouseX, oldMouseY, oldPressNodePl, oldPressNodeID;
HashMap<Integer, Node> nodeMap;

void setup() {
    size(1200, 800);

    holdNodeID = -1;
    nodeMap = new HashMap<Integer, Node>();
    RootNode rnode = new RootNode();
    rnode.setPos(350, 100);
    nodeMap.put(0, rnode);
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
