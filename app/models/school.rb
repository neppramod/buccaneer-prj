class School
  include Mongoid::Document
  # TODO: Change to proper type
  field :SchoolName, type: String
   validates :SchoolName,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
       
  field :ContactNumber, type: String
    validates :ContactNumber,  presence: true, length: { maximum: 50 },format: { with: /\A[0-9]+\z/,
    message: "only allows Numbers" }


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
