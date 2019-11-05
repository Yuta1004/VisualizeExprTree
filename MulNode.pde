public class MulNode extends Node {

    MulNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "MUL";
    }

    int calc() {
        if(left == null || right == null)
            return 0;
        return left.calc() * right.calc();
    }

}
