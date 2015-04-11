class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])

    @event.persons.each do |p|
      puts "Show is showing a showey person => #{p.name}"
    end

    return @event
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    
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
    @event.persons = @persons
    

    if @event.save
      redirect_to @event
    else
      render 'new'
    end

  end

  def update
    @event = Event.find(params[:id])

    @persons = []
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]

    
    participatingpeoplevalues.each do |pv|
      @person = Person.where(:_id => pv).first
      puts "THis person's name is #{@person.name}"
      @persons.push(@person)
    end

    # Replace @donation.persons with this new value
    @event.persons = @persons

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:eventName, :eventStartDate, :eventEndDate,:location, :description)
  end

  private
  def participating_params
    params.permit(:participating_people => [])
  end
end
