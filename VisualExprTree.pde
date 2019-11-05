import java.util.HashMap;

HashMap<Integer, Node> nodeMap;

void setup() {
    size(1200, 800);

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

void addNode(Node node) {
    int key;
    do {
        key = (int)random(0, 1024);
    } while(nodeMap.get(key) != null);
    nodeMap.put(key, node);
}
