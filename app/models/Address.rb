class Address
  include Mongoid::Document
  field :street, type: String
   #validates :street,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z0-9  ,]+\z/,
    #message: "only allows letters and white space" }

  field :city, type: String
   #validates :city,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    #message: "only allows letters and white space" }

  field :state, type: String
   #validates :state,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    #message: "only allows letters and white space" }

  field :county, type: String
   #validates :county,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    #message: "only allows letters and white space" }

  field :zip, type: String
   #validates :zip,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z0-9]+\z/,
    #message: "only allows letters and Number" }

  field	:address_type, type: String
   #validates :address_type,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    #message: "only allows letters and white space" }


  public
   scope :address_event, -> { where(address_type: "user") }

  def address_name
    "#{street}, #{city}, #{state}, #{county}, #{zip}"
  end


  #one address belong to many person
  #has_many :persons
  #belongs_to :person
  has_and_belongs_to_many :persons

  #one address can has many events
  has_many :events

end
