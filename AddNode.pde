public class AddNode extends Node {

    AddNode() {
        this.nWidth = 200;
        this.nHeight = 100;
        this.vname = "ADD";
    }

    int calc() {
        int left = (left != null) ? left.calc() : 0;
        int right = (right != null) ? right.calc() : 0;
        return left.calc() + right.calc();
    }

}
