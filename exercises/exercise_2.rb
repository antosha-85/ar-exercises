require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...


class Store < ActiveRecord::Base
end

@store1 = Store.find_by(id: 1)
@store2 = Store.find_by(id: 2)
@store1.update(name: "Burnaby1")

puts @store1.to_json
puts @store2.to_json