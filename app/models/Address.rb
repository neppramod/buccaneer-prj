class Address
  include Mongoid::Document
  field :street, type: String
  field :city, type: String
  field :state, type: String
end
