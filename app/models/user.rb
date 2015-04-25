class User
  include Mongoid::Document
  include Sorcery::Model
  authenticates_with_sorcery!

  field :email, type: String
  field :password, type: String
  field :password_confirmation, type: String


  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password, confirmation: true

  validates :email, uniqueness: true

end
