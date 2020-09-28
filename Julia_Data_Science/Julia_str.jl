# You can use typeof to check the data type in Julia

# Unlike python, the indices in Julia starts in 1, 
# therefore if yolu slice with a range, Julia will display exactly at that index
# Btw, " " space also count as one character in Julia too! 

##############################################################################################


# Str, in Julia str was defined by using " "

## String examples
s1 = "Hi"  
s2 = """\nI have a "quote" character""" # If you want to use "XXX" as the quote, remember to use """XXX""" as pingement

print(s1)# "Hi"
print(s2)# "I have a "quote" character"

## Some examples of strings
str = "Data science is fun!"

print("\n"*str[1]) # 'D'
println(str[end]) #'!'

## Slicing
print(str[4:7]) # "a sc"
print(str[end-3:end]) # "fun!"
## Concatenation
print(string(str, " Sure is :)"))
#"Data science is fun! Sure is :)"
print(str * " Sure is :)") # Str Concatenation
# "Data science is fun! Sure is :)"


## Interpolation
print("1 + 2 = $(1 + 2)")
#"1 + 2 = 3"

word1 = "Julia"
word2 = "data"
word3 = "science"

print("$word1 is great for $word2 $word3") #"Julia is great for data science"

# word can also be numeric, it functions like f string in python






# str can be compared lexicographically using comparison operators 

## findfirst(pat, str) returns the indices of the characters in the string str matching the pattern pat.
## occursin(substr, str) returns true/false depending on the presence/absence of substr in str.
## repeat(str, n) generates a new string that is the original string str repeated n times.
## length(str) returns the number of characters in the string str.
## replace(str, ptn => rep) searches string str for the pat- tern ptn and, if it is present, replaces it with rep.

