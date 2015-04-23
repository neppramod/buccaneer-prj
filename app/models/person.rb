class Person
  include Mongoid::Document
  field :first_name, type: String
  field :middle_name, type: String
  field	:last_name, type: String
  field	:email, type: String
  field :address_id, type: String
  field :primary_contact, type: String
  field	:secondary_contact, type: String

  #one user can have multiple roles :volunteer, doner, visitor
  #one role has many users
  has_and_belongs_to_many :roles, autosave: true

#<<<<<<< HEAD

  #one person has many addresses and many addresses belong to one person
  has_and_belongs_to_many :addresses, autosave: true

  has_and_belongs_to_many :events, autosave: true
#=======
  #One User has many addresses
  belongs_to :address
#>>>>>>> 15d40c8f1b87539f4fe4e12bd2187a0fcdfd6b53

end
