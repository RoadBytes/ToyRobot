# ToyRobot!

The **MOST Amazing** game to hit consoles near you.


```
Robot Output:

_ _ _ _ _
_ _ _ _ _
_ _ _ _ _
_ < _ _ _
_ _ _ _ _

input 'q' to quit or input a command for your robot
PLACE (1-5 X-coor), (1-5 Y-coor), (north, south, east, west Direction):
        place robot on coordinates facing Direction
        Erroneous input will remove the robot from the table
MOVE:   go one direction forward
LEFT:   turn left
RIGHT:  turn right
REPORT: display your location and direction
```

## Commands description

> PLACE (1-5 X-coor), (1-5 Y-coor), (north, south, east, west Direction):
>         place robot on coordinates facing Direction

* valid examples: "`place 1,3,east`" and  "`place 2,5,north`"
* invalid examples: "`place 3,east`", "`place 2,5,norf`"

> MOVE:   go one direction forward

* example: "`move`"

> LEFT:   turn left

* example: "`left`"

> RIGHT:  turn right

* example: "`right`"

* To try it out:
  1. copy or fork the repo
  2. run `ruby app/terminal_manager.rb` from the root folder

  see: APPLICATION INSTALLATION INSTRUCTIONS for more details

---

# ENVIRONMENTS

* This application was developed on: Mac OS X 10.10.5

---

# SYSTEM DEPENDENCIES & CONFIGURATION

* ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin14]

---

# APPLICATION INSTALLATION INSTRUCTIONS

## To install application:

### From your terminal

* `git clone https://github.com/RoadBytes/ToyRobot.git`
* `cd ToyRobot`
* `bundle install`
* `ruby app/terminal_manager.rb`

---

# TESTING INSTRUCTIONS

### From the root folder `ToyRobot`

* run: `rspec spec`

---

# OVERVIEW

## The application is designed to reads strings from $stdin and prints out the current state of a board to $stdout.

* You can input several commands at once by using enter `<enter>`:

`place 1,2,north left move right move move <enter>`

or just one at a time:

`place 1,2,south <enter> left <enter> move <enter> right <enter> move <enter> move <enter>`

* the state of the board is output with every `<enter>`

## INPUT FORMAT

input passed into the program are expected to be separated by spaces

## OUTPUT FORMAT

output will be printed on the terminal screen with the robot represented by:

* `v, <, >, ^` depending on where it's facing

---

# DESIGN

TODO: coming soon.

---

# For Gracious Code reviewers

## REQUIREMENTS OF THE ASSIGNMENT

## Description:

* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

## Create an application that can read in commands of the following form

> PLACE X,Y,F MOVE LEFT RIGHT REPORT

* PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. 
* The origin (0,0) can be considered to be the SOUTH WEST most corner.
* The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
* MOVE will move the toy robot one unit forward in the direction it is currently facing.
* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* REPORT will announce the X,Y and orientation of the robot.
* A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT and REPORT commands.
* Provide test data to exercise the application.

## Constraints:

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.

## Example Input and Output:

> a) PLACE 0,0,NORTH MOVE REPORT Output: 0,1,NORTH
>
> b) PLACE 0,0,NORTH LEFT REPORT Output: 0,0,WEST
>
> c) PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH

## Deliverables:

The source files, the test data and any test code.
