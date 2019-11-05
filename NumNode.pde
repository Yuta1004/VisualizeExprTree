public class NumNode extends Node {

    NumNode() {
        this(0);
    }

    NumNode(int val) {
        this.nWidth = 100;
        this.nHeight = 100;
        this.setVal(val);
    }

    @Override
    void draw() {
        // ノード本体(四角)
        fill(255);
        strokeWeight(2);
        rect(pos.x, pos.y, 100, 100);

        // 選択表示
        if(selectC)
            fill(255, 100, 100);
        else
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
