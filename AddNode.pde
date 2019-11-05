public class AddNode extends Node {

    AddNode() {
        this.nWidth = 200;
        this.nHeight = 100;
    }

    void draw() {
        // ノード本体
        fill(255);
        strokeWeight(2);
        rect(pos.x, pos.y, 200, 100);

        // 連結選択(上)
        if(selectC)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+100, pos.y, 10, 10);

        // 連結選択(左)
        if(selectL)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+200/3, pos.y+100, 10, 10);

        // 連結選択(右)
        if(selectR)
            fill(255, 100, 100);
        else
            fill(255);
        strokeWeight(2);
        ellipse(pos.x+200/3*2, pos.y+100, 10, 10);

        // ADD
        fill(0);
        textAlign(CENTER);
        textSize(32);
        text("ADD", pos.x+100, pos.y+65);
    }

    int calc() {
        if(left == null || right == null)
            return 0;
        return left.calc() + right.calc();
    }

}
