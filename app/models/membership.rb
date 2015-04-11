class Membership
  include Mongoid::Document
  field :lvl, type: String
  field :amt, type: String
  has_and_belongs_to_many :persons, autosave: true
end
