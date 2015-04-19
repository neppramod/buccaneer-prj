class Event
  include Mongoid::Document
  # TODO: Change to proper type
  field :eventName, type: String
  field :eventStartDate, type: String
  field :eventEndDate, type: String 
  field :location, type: String
  field :description, type: String
  has_and_belongs_to_many :persons, autosave: true

  belongs_to :address


end
