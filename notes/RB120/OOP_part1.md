# OOP

- Polymorphism through **ducktyping**
  - Ducktyping is the idea that, if any object quacks, then it is a duck. So we don't worry about the class, but only look at the methods the object has
- Inheritance is not always required for polymorphism to happen. We can have independent classes having a similar method. One example of this is sklearn library with it's fit method



- Encapsulation lets us hide the internal representation of the object.
- Ideally a class should have as few public methods as possible



## Collaborator Objects

- Objects stored as state within another object are called as **collaborator objects**. They can be of any class

  - ```ruby
    jim = Person.new("jim")
    bud = BullDog.new
    jim.pet = bud
    
    jim.pet.class #BullDog
    ```

- Figuring out how different collaborator objects work together, is a big part of OOP design

- Collaboration is a has-a relationship as opposed to inheritance which is an is-a relationship

- Collaboration is ingrained into the class at the design phase itself

## Modules

- Classes have the issue that they can inherit from only one super class
  - So for providing multiple inheritance, ruby supports mixing in multiple modules
- 