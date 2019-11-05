public class NumNode extends Node {

    NumNode() {
        this.setVal(0);
    }

    NumNode(int val) {
        this.setVal(val);
    }

    void draw() {
        // ノード本体(四角)
        fill(255);
        strokeWeight(2);
        rect(pos.x, pos.y, 100, 100);

        // 選択表示
        fill(255);
        strokeWeight(2);
        ellipse(pos.x+50, pos.y, 10, 10);

        // 数値
        fill(0);
        textAlign(CENTER);
        textSize(32);
        text(val, pos.x+50, pos.y+65);
        textMode(LEFT);
    }

    int calc() {
        return val;
    }

}
