# Local Variable Scope

## Variables and Blocks

- blocks create a new scope for local variables. We can think of it as an inner scope

- ```ruby
  a = 1        
  loop do      
    puts a     
    a = a + 1   
    break       
  end
  
  puts a        
  ```

  - local variable a is initialized to integer 1
  - loop method is invoked with the do end block as argument. This creates an inner scope
  - puts method called with argument 1. Since inner scope of a block has access to local variables in outer scope, this will output 1
  - a is reassigned to value a+1 (2)
  - break key word is called
  - puts method called with a as argument. Because it was re assigned within the inner scope, this will output 2

- Local variables initialized within the inner scope, cannot be accessed from the outer scope

- peer blocks, cannot reference variables initialized in other blocks

- ```ruby
  n = 10
  
  [1, 2, 3].each do |n|
    puts n
  end
  ```

  - The block parameter n, shadows the local variable n in the outer scope and prevents access to the local variable n in the outer block
    - Thus we can't make changes to the outer scoped local variable n

## Variables and Methods

- A method's scope is self contained. All variables the method definition has access to, should be passed into the method definition
- The argument passed to the method is assigned to the parameter, and is made available to the method body as a local variable
- **Local variables not initialized inside a method definition, should be defined as parameters**
- **Local variables initialized outside method definition cannot be reassigned, within a method definition**
- When return exists in the middle of a method, it will not run the following lines

# Terms to use for explaining

````ruby
a = "kiran"
loop do 
    a = "new string"
    break
end

puts a
````

- the local variable a is initialised and assigned to the string object with value kiran
- The loop method is called with the do .. end block as argument. 
- The local variable a is reassigned to string object with value "new string" (Can be summarized as string hi)
- the break key word is called to exit out of the string
- the puts method is called with local variable a as the argument



```ruby
def a_method
  puts "hello world"
end
```

- the method outputs string hello world and returns nil

```ruby
puts 5 if 3
```

- The statement outputs 5 because 3 is truthy
- If two variables reference the same object they are called as aliases
- On `lines 1–8` we are defining the method `example` which takes 1 parameter. (**for explaining about methods**)
  - On line 10 we are **calling the method and give str as argument**
- i -= 1 is a method call of `Integer#-` on `i` with `1` as argument
- Variable shadowing prevents access to variables of the same name initialized outside of the block. 



# Iterating through array

```ruby
[1, 2, 3].each do |n|
  puts n
end
```

- The each method iterates through the array. and runs the do end block. For each iteration, the block parameter is n which represent each element as we iterate through the array

- ## Each

  - each method is called on array, with the do end block as argument
  - Each sends value of the current element in the array as argument to the block. The block parameter is the reference to the current element
  - Once each is done iterating, it returns the original array

- ## Select

  - Select carries out selection, i.e. which elements should be present in the returned array
  - Select method is called on the array, with the do end block as argument. It iterates through the array and at each iteration, the current element is send to the block. The block runs and returns an output. Select evaluates the truthiness of the output. If the value is truthy, the current element is selected
  - The output is an array, which contains all the selected elements

- ## Map

- Map method uses return value of block to perform transformation of the input element.

- Map method is called on the array, with the do end block as argument. It iterates through the array and at each iteration, the current element is send to the block. The block runs, transforms the input and returns an output. 

- The transformed value is placed in a new array. This array, containing the transformed input elements is the output by the map



# Pass by Reference vs Pass by Value

- Boolean and Numbers are immutable in ruby
- nil and Range objects are also immutable
- Strings are also a collection class, even though there is need to have a separate object for each object in the collection
  - However, we can mutate and change each character in a string, while the object id for the the variable referencing the string remains the same

# Other points to remember

- If the question is pointing out a concept, calling it out is an option. For e.g the first example above shows how local variables defined in an outer scope can be accessed within the inner scope

- Variables are not changed, they are re assigned

- **Method definition** is when, within our code, we define a Ruby method using the `def` keyword.

- ```ruby
  def greetings
    puts "Goodbye"
  end
  
  word = "Hello"
  
  greetings do
    puts word
  end
  ```

  - Here the method is invoked with a block, however, it is not defined to use a block in any way. Hence, this will output goodbye

- In ruby everything is an object. Even an expression like `1+2` or a literal like `abc` is finally reduced to an object before it is used. This is called as strict evaluation strategy

  - When a literal is passed to a method, the literal is converted to an object and a reference is made to it
  - This is important because, in some languages, numbers and strings are primitives. That means, we can't invoke methods on them.

- Ruby makes copies of references and these references are passed to a method. We can use the copy of the reference to change the object that is being referenced, however, we cannot modify the original reference since we only have a copy of it.

  - So ruby is **pass by value of reference**

- 

