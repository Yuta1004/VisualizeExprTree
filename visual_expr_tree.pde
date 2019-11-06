import g4p_controls.*;
import java.util.ArrayList;
import java.awt.Font;

static final int NCENTER = 8;
static final int NLEFT = 4;
static final int NRIGHT = 2;
static final int NBODY = 1;

int holdNodeID, oldMouseX, oldMouseY, oldPressNodePl, oldPressNodeID, calcResult;
ArrayList<Node> nodeList;
GTextField numForm;

void setup() {
    frameRate(25);
    size(1200, 800);

    calcResult = 0;
    holdNodeID = -1;
    nodeList = new ArrayList<Node>();
    RootNode rnode = new RootNode();
    rnode.setPos(350, 100);
    nodeList.add(rnode);

    numForm = new GTextField(this, 1020, 325, 130, 30);
    numForm.setFont(new Font("Monaco", Font.PLAIN, 24));
    numForm.setText("10");

    GButton add = new GButton(this, 850, 50, 130, 100, "ADD");
    GButton sub = new GButton(this, 1020, 50, 130, 100, "SUB");
    GButton mul = new GButton(this, 850, 170, 130, 100, "MUL");
    GButton div = new GButton(this, 1020, 170, 130, 100, "DIV");
    GButton num = new GButton(this, 850, 290, 130, 100, "NUM");
    GButton check = new GButton(this, 850, 410, 300, 100, "CHECK");
    add.tag = "ADD";
    sub.tag = "SUB";
    mul.tag = "MUL";
    div.tag = "DIV";
    num.tag = "NUM";
    check.tag = "CHECK";
}

void draw() {
    background(255);

    // パレット
    fill(255);
    strokeWeight(3);
    rect(820, 20, 360, 760);

    // ゴミ箱
    fill(200);
    strokeWeight(2);
    rect(850, 600, 300, 150);
    fill(0);
    textAlign(CENTER, CENTER);
    text("TRASH", 1000, 675);
    textAlign(LEFT, LEFT);

    // ノード
    for(Node node : nodeList)
        node.draw();

    // 計算結果
    textAlign(CENTER, CENTER);
    textSize(24);
    text("out = "+calcResult, 1000, 550);
    textAlign(LEFT, LEFT);
}

/* mouse_func.pde */

/* node_func.pde */
