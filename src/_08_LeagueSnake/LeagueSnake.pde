
    class Segment {
    int x;
    int y;
    Segment(int x, int y){
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
     int snakeDirection = UP;
     int foodEaten = 0;
    /*
     * Setup methods
     * 
     * These methods are called at the start of the game.
     */
   
     void settings() {
        size(500,500);
    }

    
    void setup() {
        head = new Segment(250,250);
        frameRate(20);
        dropFood();
    }

    void dropFood() {
        // Set the food in a new random location
        foodX = ((int)random(50)*10);
        foodY = ((int)random(50)*10);
    }

    /*
     * Draw Methods
     * 
     * These methods are used to draw the snake and its food
     */

   
        void draw() {
        background(0,0,0);
        drawFood();
        drawSnake();
    }

    void drawFood() {
        // Draw the food
        square(foodX, foodY, 10);
        fill(255,0,0);
    }

    void drawSnake() {
        // Draw the head of the snake followed by its tail
       rect(head.x,head.y,10,10);
       fill(0,0,255);
    }

    void drawTail() {
        // Draw each segment of the tail
        
    }

    /*
     * Tail Management methods
     * 
     * These methods make sure the tail is the correct length.
     */

    void manageTail() {
        // After drawing the tail, add a new segment at the "start" of the tail and
        // remove the one at the "end"
        // This produces the illusion of the snake tail moving.

    }

    void checkTailCollision() {
        // If the snake crosses its own tail, shrink the tail back to one segment
        
    }

    /*
     * Control methods
     * 
     * These methods are used to change what is happening to the snake
     */

    
    void keyPressed() {
        // Set the direction of the snake according to the arrow keys pressed
        
    }

    void move() {
        // Change the location of the Snake head based on the direction it is moving.

        /*
        if (direction == UP) {
            // Move head up
            
        } else if (direction == DOWN) {
            // Move head down
                
        } else if (direction == LEFT) {
            
        } else if (direction == RIGHT) {
            
        }
        */
    }

    void checkBoundaries() {
        // If the snake leaves the frame, make it reappear on the other side
        
    }

    void eat() {
        // When the snake eats the food, its tail should grow and more
        // food appear
        
    }
