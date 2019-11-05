import java.util.HashMap;

int holdNodeID, oldMouseX, oldMouseY;
HashMap<Integer, Node> nodeMap;

void setup() {
    size(1200, 800);

    holdNodeID = -1;
    nodeMap = new HashMap<Integer, Node>();
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

/* マウスが押された : 移動開始 */
void mousePressed() {
    for(int key : nodeMap.keySet()) {
        if(nodeMap.get(key).checkHit(mouseX, mouseY)) {
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
