# ThinkJulia Exercise 4
import Pkg
using ThinkJulia
🐢 = Turtle()

@svg begin
    forward(🐢, 100) 
    turn(🐢, -90) 
    forward(🐢, 100)
    turn(🐢, -90) 
    forward(🐢, 100)
    turn(🐢, -90) 
    forward(🐢, 100)
end

#or 

🐢 = Turtle() 
@svg begin
    for i in 1:4 
        forward(🐢, 100) turn(🐢, -90)
    end 
end

# following is a series of exercises using turtles. They are meant to be fun, but they have a point, too. 
#While you are working on them, think about what the point is.
#The following sections have solutions to the exercises, so don’t look until you have finished (or at least tried).


#Exercise 4-2
#Write a function called square that takes a parameter named t , which is a turtle. It should use the turtle to draw a square.



#Exercise 4-3
#Write a function call that passes t as an argument to square , and then run the macro again. 



#Exercise 4-4
#Add another parameter, named len , to square. Modify the body so length of the sides is len , 
#and then modify the function call to provide a second argument. 
#Run the macro again. Test with a range of values for len .



#Exercise 4-5
#Make a copy of square and change the name to polygon . 
#Add another parameter named n and modify the body so it draws an -sided regular polygon.


#Exercise 4-6
#Write a function called circle that takes a turtle, t , 
#and radius, r , as parameters and that draws an approximate circle
#by calling polygon with an appropriate length and number of sides. 
#Test your function with a range of values of r 



#Exercise 4-7
#Make a more general version of called arc that takes an additional parameter angle , 
#which determines what fraction of a circle to draw. is in units of degrees, so when angle = 360 , 
#arc should draw a complete circle.