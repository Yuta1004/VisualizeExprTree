void mousePressed() {
    // 今回押した場所を特定
    int newPressNodePl = 0, newPressNodeID = 0, idx = 0;
    for(Node node : nodeList) {
        newPressNodePl = node.click(mouseX, mouseY);
        if(newPressNodePl > 0){
            newPressNodeID = idx;
            break;
        }
        ++ idx;
    }
    oldMouseX = mouseX;
    oldMouseY = mouseY;

    // ノード連結
    if((newPressNodePl&NBODY) == NBODY) {
        holdNodeID = newPressNodeID;
        return;
    }
    chainNode(newPressNodePl, newPressNodeID);
}

void mouseDragged() {
    // ノード移動
    if(holdNodeID == -1)
        return;
    nodeList.get(holdNodeID).movePos(mouseX-oldMouseX, mouseY-oldMouseY);
    oldMouseX = mouseX;
    oldMouseY = mouseY;
}

void mouseReleased() {
    holdNodeID = -1;
}
