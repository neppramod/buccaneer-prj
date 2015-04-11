class DonationsController < ApplicationController
    def index
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])

    @donation.persons.each do |p|
      puts "Show is showing a showey person => #{p.name}"
    end

    return @donation
  end

  def new
    @donation = Donation.new
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def create
    @donation = Donation.new(donation_params)
    
    @persons = []

    
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]
    puts "I am saying something here"

    participatingpeoplevalues.each do |pv|
      @person = Person.where(:_id => pv).first
      puts "THis person's name is #{@person.name}"
      @persons.push(@person)
    end

    # Replace @donation.persons
    @donation.persons = @persons
    

    if @donation.save
      redirect_to @donation
    else
      render 'new'
    end

  end

  def update
    @donation = Donation.find(params[:id])

    @persons = []
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]

    
    participatingpeoplevalues.each do |pv|
      @person = Person.where(:_id => pv).first
      puts "THis person's name is #{@person.name}"
      @persons.push(@person)
    end

    # Replace @donation.persons with this new value
    @donation.persons = @persons

    if @donation.update(donation_params)
      redirect_to @donation
    else
      render 'edit'
    end
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    redirect_to donations_path
  end

  private
  def donation_params
    params.require(:donation).permit(:monetary_value, :date, :type, :description, :participating_people => [])
  end

  private
  def participating_params
    params.permit(:participating_people => [])
  end
end
