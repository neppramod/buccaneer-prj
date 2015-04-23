class Role
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

	#one user can have multiple roles :volunteer, doner, visitor
    #one role has many users
   has_and_belongs_to_many :persons
  
end