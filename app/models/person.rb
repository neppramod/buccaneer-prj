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

  field :primary_contact, type: String
    validates :primary_contact,  presence: true, length: { maximum: 50 },format: { with: /\A[0-9]+\z/,
    message: "only allows Numbers" }

  field	:secondary_contact, type: String
 

  #one user can have multiple roles :volunteer, doner, visitor
  #one role has many users
  has_and_belongs_to_many :roles

  #one person has many addresses and many addresses belong to one person
  #has_and_belongs_to_many :addresses, :dependent => :restrict, autosave: true
  has_and_belongs_to_many :addresses, :dependent => :delete, autosave: true
  #has_and_belongs_to_many :addresses, :dependent => :destroy, autosave: true
  #has_many :addresses, autosave: true

  has_and_belongs_to_many :expertises, autosave: true

  has_and_belongs_to_many :interests, autosave: true

  has_and_belongs_to_many :educations, autosave: true


  has_and_belongs_to_many :events, autosave: true

  accepts_nested_attributes_for :addresses

  validates_associated :addresses
end
