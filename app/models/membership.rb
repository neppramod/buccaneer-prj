class Membership
  include Mongoid::Document
  
  field :lvl, type: String
   validates :lvl,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and white space" }

  field :amt, type: String

  has_and_belongs_to_many :persons, autosave: true
end
