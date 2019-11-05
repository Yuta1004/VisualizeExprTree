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

/* マウスが押された */
void mousePressed() {
    // 今回押した場所を特定
    int newPressNodePl = 0, newPressNodeID = 0;
    for(int key : nodeMap.keySet()) {
        newPressNodePl = nodeMap.get(key).click(mouseX, mouseY);
        if(newPressNodePl > 0){
            newPressNodeID = key;
            break;
        }
    }

    // マウス座標更新
    oldMouseX = mouseX;
    oldMouseY = mouseY;

    // 状態チェック
    if(newPressNodePl == 0)
        return;
    if(oldPressNodePl == 0) {
        oldPressNodePl = newPressNodePl;
        oldPressNodeID = newPressNodeID;
        return;
    }

    // swap
    if((oldPressNodePl & NCENTER) == NCENTER) {
        int tmp = oldPressNodePl;
        oldPressNodePl = newPressNodePl;
        newPressNodePl = tmp;
    }

    // 親に殺を設定する
    Node parent = nodeMap.get(oldPressNodeID);
    Node child = nodeMap.get(newPressNodeID);
    parent.release();
    child.release();
    if((oldPressNodePl & NLEFT) == NLEFT)
        parent.setLeft(child);
    if((oldPressNodePl & NRIGHT) == NRIGHT)
        parent.setRight(child);

    // 状態リセット
    oldPressNodePl = 0;
    oldPressNodeID = 0;
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
