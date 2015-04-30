class Expertise
  include Mongoid::Document
  field :expertise, type: String
   
  has_and_belongs_to_many :persons, autosave: true  
end
