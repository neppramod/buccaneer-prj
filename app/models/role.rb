class Role
  include Mongoid::Document
  
  field :name, type: String
   validates :name,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  field :description, type: String
   validates :description,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and white space" }

	#one user can have multiple roles :volunteer, doner, visitor
    #one role has many users
   has_and_belongs_to_many :persons
  
end