class Person
  include Mongoid::Document
  field :name, type: String
  field :hobby, type: String

  has_many :comments

  has_and_belongs_to_many :events
  
end
