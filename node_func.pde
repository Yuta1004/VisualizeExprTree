/* 管理ノード追加 */
void addNode(Node node) {
    int key;
    do {
        key = (int)random(0, 1024);
    } while(nodeMap.get(key) != null);
    nodeMap.put(key, node);
}

/* ノード連結処理 */
void chainNode(int newPressNodePl, int newPressNodeID) {
    // 状態チェック
    if(newPressNodePl == 0)
        return;
    if(oldPressNodePl == 0) {
        oldPressNodePl = newPressNodePl;
        oldPressNodeID = newPressNodeID;
        return;
    }
    if((oldPressNodePl & NCENTER) != NCENTER && (newPressNodePl & NCENTER) != NCENTER){
        oldPressNodePl = 0;
        oldPressNodeID = 0;
        nodeMap.get(oldPressNodeID).release();
        nodeMap.get(newPressNodeID).release();
        return;
    }

    // swap
    if((oldPressNodePl & NCENTER) == NCENTER) {
        int tmp = oldPressNodeID;
        oldPressNodeID = newPressNodeID;
        newPressNodeID = tmp;
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
