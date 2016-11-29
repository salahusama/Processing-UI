# Processing-UI
Assignment 1 for OOP Year 2
Demo:

[![Video](http://img.youtube.com/vi/d7yHUb2O6WQ/0.jpg)](https://www.youtube.com/watch?v=d7yHUb2O6WQ&t=6s)

I have tried using as many different concepts as possible to learn more.
I used built in classes like:
* PImage
* PVector
* FloatList
* ArrayList
* PShape

My Interface Consists of 6 main areas:
* The Ship
  * Turns using 'a' and 'd'
  * Boosters turn on when 'space' is pressed
* The Bar Chart
  * Shows the status of the engine
  * Bars change color based on height (height is random)
  * Engine goes in boost mode when 'space' is pressed
* The Path Planner
  * It shows the path the ship is taking
  * The path can be editted by the user by dragging the points across
* The Orbit Viewer
  * This shows some objects around the ship
  * If you press 'i', it gives more info on the objects (Enemies or Allies)
* The Globe
  * This is a sphere with a texture
  * It shows where the captain's allegiance lies
* The Boxes
  * Visual effects to keep everything tidy
  * Have a nice animation
    * The smaller ones are child classes (TBox) of the class (Box)
    * They have an extra function to display input
    * The one on the left greets the captain
    * The one on the Right shows the status and warns him when he speeds up too much
