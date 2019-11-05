NumNode num = new NumNode(10);

void setup() {
    size(1200, 800);
    num.setPos(100, 200);
}

void draw() {
    background(255);

    // パレット
    fill(255);
    strokeWeight(3);
    rect(820, 20, 360, 760);

    num.draw();
}
