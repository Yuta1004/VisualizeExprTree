/* 管理ノード追加 */
void addNode(Node node) {
    nodeList.add(node);
}

/* ノード連結処理 */
void chainNode(int newPressNodePl, int newPressNodeID) {
    // swap
    if((oldPressNodePl & NCENTER) == NCENTER) {
        int tmp = oldPressNodeID;
        oldPressNodeID = newPressNodeID;
        newPressNodeID = tmp;
        tmp = oldPressNodePl;
        oldPressNodePl = newPressNodePl;
        newPressNodePl = tmp;
    }

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
        nodeList.get(oldPressNodeID).release();
        nodeList.get(newPressNodeID).release();
        return;
    }

    // 親に殺を設定する
    Node parent = nodeList.get(oldPressNodeID);
    Node child = nodeList.get(newPressNodeID);
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
