class Person
  include Mongoid::Document

  field :first_name, type: String
      validates :first_name,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  field :middle_name, type: String
   validates :middle_name,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  field	:last_name, type: String
    validates :last_name,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  field	:email, type: String
    validates :email,  presence: true, length: { maximum: 50 } ,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "only allows letters" }

  field :address_id, type: String
   validates :address_id,  presence: true, length: { maximum: 50 },format: { with: /\A[a-zA-Z0-9 ,]+\z/,
    message: "only allows AlphaNumeric" }

  field :primary_contact, type: String
    validates :primary_contact,  presence: true, length: { maximum: 50 },format: { with: /\A[0-9]+\z/,
    message: "only allows Numbers" }

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
