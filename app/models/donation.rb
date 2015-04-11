class Donation
  include Mongoid::Document
  # TODO: Change to proper type
  field :monetary_value, type: String
  field :date, type: String
  field :type, type: String
  field :description, type: String
  has_and_belongs_to_many :persons, autosave: true

end
