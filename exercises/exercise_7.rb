require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "Please enter the store name"
name = gets.chomp.to_s;
# name = gets.chomp.to_i
# Your code goes here ...
class Employee < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates_numericality_of :hourly_rate ,greater_than_or_equal_to: 40, less_than_or_equal_to: 200;
    validates :store_id, presence: true
end

class Store < ActiveRecord::Base
    validates :name, length: { minimum: 3}
    validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0}
    validate :at_least_one_apparel
     def at_least_one_apparel 
        if !(womens_apparel || mens_apparel)
            errors.add(:womens_apparel, "apparel must be present")
            errors.add(:mens_apparel, "apparel must be present")
        end
    end
end

# puts Employee.create(hourly_rate: 30).valid?
# store1 = Store.create(name: name)
northvancouver = Store.create(name: name, annual_revenue: 600000, mens_apparel: true, womens_apparel: false)
# store1.validate
# puts store1.errors.messages
