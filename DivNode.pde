public class DivNode extends Node {

    DivNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "DIV";
    }

    int calc() {
        if(left == null || right == null)
            return 0;
        return left.calc() / right.calc();
    }

}
