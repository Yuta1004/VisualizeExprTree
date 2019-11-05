import java.util.HashMap;

static final int NCENTER = 8;
static final int NLEFT = 4;
static final int NRIGHT = 2;
static final int NBODY = 1;

int holdNodeID, oldMouseX, oldMouseY;
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

/* マウスが押された */
void mousePressed() {
    for(int key : nodeMap.keySet()) {
        int ret  = nodeMap.get(key).click(mouseX, mouseY);
        switch(ret) {
        case NCENTER:
            break;

        case NLEFT:
            break;

        case NRIGHT:
            break;

        case NBODY:
            holdNodeID = key;
            break;
        }
    }
    oldMouseX = mouseX;
    oldMouseY = mouseY;
}

/* マウスがドラッグされた : 移動 */
void mouseDragged() {
    if(holdNodeID == -1)
        return;
    nodeMap.get(holdNodeID).movePos(mouseX-oldMouseX, mouseY-oldMouseY);
    oldMouseX = mouseX;
    oldMouseY = mouseY;
}

/* マウスが離された : 移動終了 */
void mouseReleased() {
    holdNodeID = -1;
}

/* 管理ノード追加 */
void addNode(Node node) {
    int key;
    do {
        key = (int)random(0, 1024);
    } while(nodeMap.get(key) != null);
    nodeMap.put(key, node);
}
