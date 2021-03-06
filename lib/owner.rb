require "pry"
class Owner
attr_reader :species
attr_accessor :name, :pets
@@all = []

def initialize(species)
  @species = species
  @@all << self
  @pets = {:fishes => [], :dogs => [], :cats => []}
end

def self.all
  @@all
end

def self.count
  @@all.length
end

def self.reset_all
  @@all.clear
end

def say_species
   "I am a #{@species}."
end

def buy_fish(name)
 fish = Fish.new(name)
 @pets[:fishes] << fish
end

def buy_cat(name)
  cat = Cat.new(name)
  @pets[:cats] << cat
end

def buy_dog(name)
  dog = Dog.new(name)
  @pets[:dogs] << dog
end

def walk_dogs
  self.pets[:dogs].each{|dog| dog.mood = "happy"}
end

def play_with_cats
  self.pets[:cats].each{|cat| cat.mood = "happy"}
end

def feed_fish
  self.pets[:fishes].each{|fish| fish.mood = "happy"}
end

def sell_pets
  self.pets[:fishes].each{|fish| fish.mood ="nervous"}
  self.pets[:fishes].clear
  self.pets[:cats].each{|cat| cat.mood ="nervous"}
  self.pets[:cats].clear
  self.pets[:dogs].each{|dog| dog.mood ="nervous"}
  self.pets[:dogs].clear
end

def list_pets
  "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
end

end
