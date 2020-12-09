# The Object Model

- Mainly to reduce the rework required for new changes
- Create containers for data which can be manipulated without affecting the whole program
  - so that parts can be sectioned off based on what procedures are being performed

## Terms

- Encapsulation
  - Hiding pieces of functionality and not letting other parts access it
    - Ruby does this by giving interfaces (methods) for interacting with objects
- Polymorphism
  - Ability for different types of data to respond to a common interface
  - For e.g puts method uses the to_s functionality of each data class. The way to_s is defined for numbers is not the same way as it is defined for arrays
- Inheritance
  - A class can get features from a superclass
  - This lets us define master classes and then subclasses with more fine grained features
- Modules and mixins
  - **Not clear**
- **Instantiation**: Creating a new class instance. 



# Objects

- Everything in ruby that has a value is an object. Blocks and methods are not. 
- Different objects are instances of the same class

# Classes

## Definition

	- Similar to method.
	- Replace def with class
	- use CamelCase
	- Filenames should be in snake_case and should reflect class names

```ruby
class GoodDog
end

sparky = GoodDog.new

```

- this file would be called good_dog.rb
- **We are instantiating an object called sparky from the class GoodDog**. Sparky is an instance of class GoodDog 
- When you call the class method new, you get a new object

# Modules

- Collection of behaviors that can be used in other classes via mixins

- We can mixin module to a class using the include method invocation

- ```ruby
  module Speak
    def speak(sound)
      puts sound
    end
  end
  
  class GoodDog
    include Speak
  end
  
  class HumanBeing
    include Speak
  end
  
  sparky = GoodDog.new
  sparky.speak("Arf!")        # => Arf!
  bob = HumanBeing.new
  bob.speak("Hello!")         # => Hello!
  ```



# Method Lookup

- Ruby has a distinct method lookup path. To see it we can use the **ancestors** method

  - For GoodDog class when we run ancestors we get

  - ```ruby
    GoodDog
    Speak
    Object
    Kernel
    BasicObject
    ```

  - This shows that when we search for a method, say speak, it will first look within the GoodDog class and if it can't find it, it will go to Speak module and so on



# Classes and Object Part 1

- Instance variables track the state of the instances. They are maintained at an instance level
  - E.g if we have a dog class, each instance of the class can have different names, weight, height etc
- Instance methods decide the behavior of the instances. They are maintained at a class level
  - methods like bark, run, speak etc. 

## Initialize Method

- It's an instance method which is called every time we create a new object. (New is a class method)
  - Calling the new class method eventually leads initialize instance method to being called
  - Initialize method is a constructor, because it is called every time we create a new object

## Instance Variables

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```

- @name is an instance variable
- The instance variable will remain as long as the object exists
- You can pass variables to the initialize instance method using the New class method
- In the last line, the string "sparky" is given as argument to the New class variable and it is passed to the initialize instance method
  - The local variable name is assigned to the string `"sparky"`
  - Within the constructor (i.e. initialize) the instance variable `@name` is assigned to `name`. Thus the string `sparky` is assigned to instance variable `@name`

## Instance Methods

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end
```

- We can access instance variables from within the instance methods

## Attribute accessors

- There are three kinds of accessors

  - attr_accessor
  - attr_reader
  - attr_writer
  - The shorthand syntax is `attr_accessor :name, :height, :weight `

- If we are defining on our own, the syntax for set method is

  - ```ruby
    def name=(n)              # This was renamed from "set_name="
    	@name = n
    end
    ```

- Instead of using the @name instance variable as in the example above, we can use name directly (because it now refers to the get instance getter method)

- Setting attr_accessor gives us a setter method, a getter method and an instance variable

- The following code will not work as expected

  - ```ruby
    def change_info(n, h, w)
      name = n
      height = h
      weight = w
    end
    ```

  - That is because, ruby will assume that name, height and weight are local variable within the function scope of change info. 

  - So instead we will have to use `self.name`, `self.height` and `self.weight`




# Class Methods and Variables

## Class Methods

- class methods can be called on the class itself. When creating class methods, we prepend it with the keyword self

  - ```ruby
    def self.what_am_i         # Class method definition
      "I'm a GoodDog class!"
    end
    GoodDog.what_am_i          # => I'm a GoodDog class!
    ```

## Class Variables

- Class variables have two @@ at the start
- Class variables can be accessed from within an instance method
- Constants have the first letter as capital. Generally the whole word is kept at upper case

## to_s

- to_s is an instance method that comes with every class. Puts calls to_s for every object other than array. For array it calls to_s on all its individual elements
- We can over ride this with our own to_s method
- to_s is also called automatically during string interpolation

## self

- self is shown to be used in two settings
  - Setter methods, when we have to distinguish between local variables and setters
  - when defining class methods
- From within a class, when an instance method calls self, it references the calling object.
- Self from inside a class, but outside an instance method, returns the class itself

# Inheritance

- Allows a class to inherit methods from it's parent class

- ```ruby
  class Animal
    def speak
      "Hello!"
    end
  end
  
  class GoodDog < Animal
  end
  
  class Cat < Animal
  end
  
  sparky = GoodDog.new
  paws = Cat.new
  puts sparky.speak           # => Hello!
  puts paws.speak             # => Hello!
  ```

  - If necessary by defining a speak method within a child class (say cat), we can override the method

## Super

- When called within an instance method, returns the output of the instance method from the super class
  - If no argument is specified for super, every argument sent to the instance method, is sent to super
  - In case the super version of the method has no arguments, we will have to use super as **super()**
  - Super is commonly used in initialize

## Modules

- Deciding between inheritance and modules is an important question in designing the program

  - You can inherit only from one class. You can mixin as many modules as you like
  - is-a relations are generally modelled as inheritance, where as has-a relations are modelled as mixins
  - We cannot use modules to create new objects. It's main use is to group functions together

- The method lookup order is as follows

  - First any modules with the most recent module
  - Then the super class
  - Then the ancestors of the super class (including any modules in it which were not included directly in the child class)

- Modules have 2 more uses other than grouping methods

  - Namespacing: Organizing similar classes under a module

    - This prevents classes colliding with other similarly named classes 

    - It helps to recognize similar classes (classes grouped in the same module are similar)

    - ```ruby
      module Mammal
        class Dog
          def speak(sound)
            p "#{sound}"
          end
        end
      
        class Cat
          def say_name(name)
            p "#{name}"
          end
        end
      end
      
      buddy = Mammal::Dog.new
      ```

  - Container for methods

    - Use modules for storing other methods. Especially methods which seem to not belong anywhere

      - ```ruby
        module Mammal
          ...
        
          def self.some_out_of_place_method(num)
            num ** 2
          end
        end
        
        value = Mammal.some_out_of_place_method(4) #Preferred
        value = Mammal::some_out_of_place_method(4)
        ```

      - Methods defined in this way can be accessed directly from the module as shown above

## Private Protected and Public

- Used for restricting access especially to methods defined within a class (both class and instance methods)
- By default all methods are public. i.e. it is accessible to everyone who knows the class/object name and methods within it
- There are some methods which do work within the class, but are not available to external objects. 
  - **All methods below the private keyword will be private methods **
  - Trying to access private methods will give following error `NoMethodError: private method `human_years' called for 
  - Within the class the method can be called as `human_years` not `self.human_years`
    - As of ruby 2.7 using `self.human_years` is also allowed
- Protected is inbetween public and private
  - From outside the class it behaves like private
  - From inside the class it behaves like public methods
    - i.e we can access it within the class using self prepended 
    - So from inside a class, it can use it on other objects of the same class
- 





