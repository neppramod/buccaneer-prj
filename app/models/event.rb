class Event
  include Mongoid::Document
  # TODO: Change to proper type
  field :eventName, type: String
     validates :eventName,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and white space" }

  field :eventStartDate, type: String
     validates :eventStartDate,  presence: true, length: { maximum: 50 } ,format: { with: /\d{2}\/\d{2}\/\d{4}/,
    message: "must be date and time"}

  field :eventEndDate, type: String
     validates :eventEndDate,  presence: true, length: { maximum: 50 } ,format: { with: /\d{2}\/\d{2}\/\d{4}/,
    message: "must be date and time"} 

  field :location, type: String
     validates :location,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and white space" }

  field :description, type: String
     validates :description,  presence: true, length: { maximum: 50 } ,format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and white space" }
    
  has_and_belongs_to_many :persons, autosave: true

  belongs_to :address


end
