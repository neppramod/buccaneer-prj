class Expertise
  include Mongoid::Document
  field :expertise, type: String
    validates :expertise,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  has_and_belongs_to_many :persons, autosave: true  
end
