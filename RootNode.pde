public class RootNode extends Node {

    RootNode() {
        this.nWidth = 100;
        this.nHeight = 100;
    }

    @Override
    void draw() {
        // ノード本体(四角)
        fill(255);
        strokeWeight(2);
        rect(pos.x, pos.y, 100, 100);

        // 連結選択(左)
        if(selectL)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+100/3, pos.y+100, 10, 10);

        // 数値
        fill(0);
        textAlign(CENTER);
        textSize(32);
        text("ROOT", pos.x+50, pos.y+65);
        textMode(LEFT);
    }

    int calc() {
        return val;
    }

}
