class Interest
  include Mongoid::Document
  # TODO: Change to proper type
  field :name, type: String
  field :description, type: String
  has_and_belongs_to_many :persons, autosave: true

end
