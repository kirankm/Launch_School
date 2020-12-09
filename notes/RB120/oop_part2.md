# Equivalence

- Not everything in ruby is an object. E.g. blocks, functions, methods, if statements, argument lists

- `str1 == str2` is true if both of them have the same value. Even if they are pointing towards different string objects

  - So here we are checking are the values within the objects same and not if both objects have the same value

- In ruby we have another method `equal?` which compares whether two strings are referencing the same object

  - ```ruby
    str1 = "smthng"
    str2 = "smthng"
    str1_copy = str1
    str1.equal?(str2) #false
    str1.equal?(str1_copy) #true
    ```

  ### How does == figure out what value to use

  - `==`is an instance method available to all objects

    - `a.==(b)` will also work

  - The original `==` is defined by the Basic Object class from which all objects are inherited. But ideally a class should define how `==` applies to instances of that class

    - The default implementation of `==` is same as `equal`

    - ```ruby
      class Person
        attr_accessor :name
      
        def ==(other)
          name == other.name     # relying on String#== here
        end
      end
      ```

- When we use `4 == 4.0` there is an `Integer#==` working in the background which is considering cases where integers are compared with floats

- When we define `==` we also get a `!=` for free

- For symbols and numbers if value is same then objects are also same. This is a performance optimization and why symbols make better hash keys

### Other equivalence functions

- eql?

  - Compares if two objects are of the same class
  - If two objects have the same value

- ===

  - Used for comparison in case statements. Only needed if custom class is used in case statements

  - ```ruby
    1..5 == 3 #false
    1...5 === 3 #true
    ```

  - The reason for true is that Range#=== looks at whether the given value is within the range

  - The main idea is that `case num when a...b `is using `(a...b).===(num)` in the background

- 

