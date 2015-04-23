class Education
  include Mongoid::Document
  # TODO: Change to proper type
  field :educationlevel, type: String
   validates :educationlevel,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and white space" }
  has_and_belongs_to_many :persons, autosave: true

end
