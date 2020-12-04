require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end
  def say_species
    "I am a human."
  end
  def self.all
    @@all 
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}  
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self} 
  end
  def buy_cat(name)
    new_cat = Cat.new(name, self)
    self.cats 
  end
  def buy_dog(name)
    new_dog = Dog.new(name, self)
    self.dogs 
  end
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}  
  end
  def sell_pets
    self.cats.each {|cat| cat.mood = "nervous"}  
    self.cats.each {|cat| cat.owner = nil}
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil} 
  end
  def list_pets
    cats = self.cats.count 
    dogs = self.dogs.count 
    "I have #{dogs} dog(s), and #{cats} cat(s)."
  end
end