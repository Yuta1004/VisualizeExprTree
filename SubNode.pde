public class SubNode extends Node {

    SubNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "SUB";
    }

    int calc() {
        if(left == null || right == null)
            return 0;
        return left.calc() - right.calc();
    }

}
