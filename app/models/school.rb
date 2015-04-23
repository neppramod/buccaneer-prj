class School
  include Mongoid::Document
  # TODO: Change to proper type
  field :SchoolName, type: String
   validates :SchoolName,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
       
  field :ContactNumber, type: String
    validates :ContactNumber,  presence: true, length: { maximum: 50 },format: { with: /\A[0-9]+\z/,
    message: "only allows Numbers" }
      
  has_and_belongs_to_many :persons, autosave: true

end
