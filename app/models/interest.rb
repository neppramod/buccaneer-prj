class Interest
  include Mongoid::Document
  # TODO: Change to proper type
  field :name, type: String
    validates :name,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }
  field :description, type: String
   validates :description,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z0-9 ]+\z/,
    message: "only allows letters" }
  has_and_belongs_to_many :persons, autosave: true

end
