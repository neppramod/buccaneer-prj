class Education
  include Mongoid::Document
  # TODO: Change to proper type
  field :educationlevel, type: String
  has_and_belongs_to_many :persons, autosave: true

end
