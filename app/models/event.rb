class Event
  include Mongoid::Document
  # TODO: Change to proper type
  field :eventName, type: String
     validates :eventName,  presence: true, length: { maximum: 50 }

  field :eventStartDate, type: String

  field :description, type: String

  field :eventEndDate, type: String

  field :street, type: String

  field :city, type: String

  field :state, type: String

  field :county, type: String

  field :zip, type: String



  def address_name
    "#{street}, #{city}, #{state}, #{county}, #{zip}"
  end
    
  has_and_belongs_to_many :persons, autosave: true

  

end
