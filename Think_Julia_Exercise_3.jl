#Exercise 3-2
#Write a function named rightjustify that takes a string named s as a parameter 
#and prints the string with enough leading spaces 
#so that the last letter of the string is in column 70 of the display.

function rightjustify(s)
    len = length(s)
    blank_space = 70 - len
    println((" "^blank_space)*s)
end

rightjustify("hello")

#Exercise 3-3
#A function object is a value you can assign to a variable or pass as an argument. 
#For example, dotwice is a function that takes a function object as an argument and calls it twice:

function dotwice(f)
    f()
    f() 
end

function printspam() 
    println("spam")
end

dotwice(printspam)

#Exercise 3-4
#1. Write a function printgrid that draws a grid like the following:
#2. Write a function that draws a similar grid with four rows and four columns.

#println("+"*("----+"^2))

function printgrid(times)
    println("+"*("----+")^times)
    println("|"*("    |")^times)
    println("|"*("    |")^times)
    println("|"*("    |")^times)
    println("|"*("    |")^times)
    println("+"*("----+")^times)
end

printgrid(6)


