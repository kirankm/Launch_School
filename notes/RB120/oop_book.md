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
  - 