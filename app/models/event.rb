class Event
  include Mongoid::Document
  field :name, type: String
  field :location, type: String
  #embedded_in :person
  has_and_belongs_to_many :persons, autosave: true
end
