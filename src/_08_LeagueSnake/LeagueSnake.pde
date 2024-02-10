//To do
//make the snake grow


class Segment {
  int x;
  int y;
  Segment(int x, int y) {
    this.x=x;
    this.y=y;
  }
}
/*
     * Game variables
 *
 * Put all the game variables here.
 */
Segment head;
int foodX;
int foodY;
int direction = UP;
int foodEaten = 0;
ArrayList<Segment> tail = new ArrayList<Segment>();
/*
     * Setup methods
 *
 * These methods are called at the start of the game.
 */

void settings() {
  size(250, 250);
}

void setup() {
  head = new Segment(125, 125);
  frameRate(20);
  dropFood();
}

void dropFood() {
  // Set the food in a new random location
  foodX = ((int)random(25)*10);
  foodY = ((int)random(25)*10);
}

/*
     * Draw Methods
 *
 * These methods are used to draw the snake and its food
 */


void draw() {
  background(0, 0, 0);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  // Draw the food
  fill(0, 0, 255);
  square(foodX, foodY, 10);
}

void drawSnake() {
  // Draw the head of the snake followed by its tail
  fill(255, 0, 0);
  rect(head.x, head.y, 10, 10);
  manageTail();
}

void drawTail() {
  // Draw each segment of the tail
  for (Segment segment : tail) {
    fill(255, 0, 0);
    rect(segment.x, segment.y, 10, 10);
  }
}

/*
     * Tail Management methods
 *
 * These methods make sure the tail is the correct length.
 */

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and
  //remove the one at the "end"
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  tail.add(new Segment(head.x, head.y));
  tail.remove(0);
}

void checkTailCollision() {
  // If the snake crosses its own tail, shrink the tail back to one segment
  for (Segment tailPart : tail) {
    if (tailPart.x == head.x && tailPart.y == head.y) {
      foodEaten = 1;
      tail.clear();
      tail.add(new Segment(head.x, head.y));
    }
  }
}
/*
     * Control methods
 *
 * These methods are used to change what is happening to the snake
 */


void keyPressed() {
  // Set the direction of the snake according to the arrow keys pressed
  if (keyCode == UP && direction != DOWN) {
    direction = UP;
  }
  if (keyCode == DOWN && direction != UP) {
    direction = DOWN;
  }
  if (keyCode == LEFT && direction != RIGHT) {
    direction = LEFT;
  }
  if (keyCode == RIGHT && direction != LEFT) {
    direction = RIGHT;
  }
}


void move() {
  // Change the location of the Snake head based on the direction it is moving.
  if (direction == UP) {
    head.y--;
  } else if (direction == DOWN) {
    head.y++;
  } else if (direction == LEFT) {
    head.x--;
  } else if (direction == RIGHT) {
    head.x++;
  }
  checkBoundaries();
}


void checkBoundaries() {
  // If the snake leaves the frame, make it reappear on the other side
  if (head.x>=250) {
    head.x = 0;
  } else if (head.x<=0) {
    head.x = 250;
  } else if (head.y>=250) {
    head.y = 0;
  } else if (head.y<=0) {
    head.y = 250;
  }
}

void eat() {
  // When the snake eats the food, its tail should grow and more
  // food appear'
  if (head.x >= foodX+5 && head.x <= foodX && head.y >= foodY && head.y <= foodY) {
    foodEaten++;
    dropFood();
    Segment newTail = new Segment(head.x, head.y);
    tail.add(newTail);
    System.out.println("Eaten " + foodEaten);
  }
}
