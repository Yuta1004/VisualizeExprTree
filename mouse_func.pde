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
    if(newPressNodePl == 0){
        oldPressNodePl = 0;
        oldPressNodeID = 0;
        return;
    }
    if(newPressNodePl - (newPressNodePl&NBODY) == 0) {
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
    if(850 <= mouseX && mouseX <= 1150 && 600 <= mouseY && mouseY <= 750) {
        nodeList.get(holdNodeID).reset(1);
        nodeList.remove(holdNodeID);
    }
    holdNodeID = -1;
}
