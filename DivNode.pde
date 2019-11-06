public class DivNode extends Node {

    DivNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "DIV";
    }

    int calc() {
        int left = (left != null) ? left.calc() : 0;
        int right = (right != null) ? right.calc() : 0;
        return left.calc() / right.calc();
    }
}
