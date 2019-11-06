public class DivNode extends Node {

    DivNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "DIV";
    }

    int calc() {
        int leftVal = (left != null) ? left.calc() : 0;
        int rightVal = (right != null) ? right.calc() : 0;
        return leftVal / rightVal;
    }
}
