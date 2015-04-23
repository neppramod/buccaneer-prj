class Person
  include Mongoid::Document
  field :name, type: String
  field :hobby, type: String

  has_many :comments


  #one person has many addresses and many addresses belong to one person
  has_and_belongs_to_many :addresses, autosave: true

  has_and_belongs_to_many :events, autosave: true

end
