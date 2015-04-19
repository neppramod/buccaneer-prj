class Address
  include Mongoid::Document
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :county, type: String
  field :zip, type: String
  field	:address_type, type: String


  public
   scope :address_event, -> { where(address_type: "user") }

  def address_name
    "#{street}, #{city}, #{state}, #{county}, #{zip}"
  end


  #one address belong to many person
  has_many :persons

  #one address can has many events
  has_many :events

end
