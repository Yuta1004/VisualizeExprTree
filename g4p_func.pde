// UI部品に色を設定する
void setUIColor(GButton button) {
    button.setLocalColor(3, color(255, 0, 0));
    button.setLocalColor(4, color(255, 100, 100, 100));
    button.setLocalColor(6, color(230, 100, 100, 150));
    button.setLocalColor(14, color(200, 100, 100, 200));
}

// ボタンイベントハンドラ
public void handleButtonEvents(GButton button, GEvent event) {
    Node node = null;

    switch(button.tag) {
    case "ADD":
        node = new AddNode();
        break;

    case "SUB":
        node = new SubNode();
        break;

    case "MUL":
        node = new MulNode();
        break;

    case "DIV":
        node = new DivNode();
        break;

    case "NUM":
        node = new NumNode(10);;;;
        break;
    }

    node.setPos(400, 400);
    addNode(node);
}
