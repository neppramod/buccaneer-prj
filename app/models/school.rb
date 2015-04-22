class School
  include Mongoid::Document
  # TODO: Change to proper type
  field :SchoolName, type: String
  field :ContactNumber, type: String
  has_and_belongs_to_many :persons, autosave: true

end
