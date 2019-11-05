public class AddNode extends Node {

    AddNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "ADD";
    }

    int calc() {
        if(left == null || right == null)
            return 0;
        return left.calc() + right.calc();
    }

}
