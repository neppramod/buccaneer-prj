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

    
    
    #@persons = [Person.where(:_id => "550c9b3a64656c13af050000").first]
    
    #@persons = Person.where(:id => params[:participating_people])
    #@persons = Person.where(:id => participating_params)
    #@persons = Person.all

    #@event.persons << @persons

    #@person = Person.new
    #@person.name="Kamrul";
    #@event.persons << [@person]

    @persons = []

    
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]
    puts "I am saying something here"

    participatingpeoplevalues.each do |pv|
      @person = Person.where(:_id => pv).first
      puts "THis person's name is #{@person.name}"
      @persons.push(@person)
    end

    puts "I did not get any value"

    
    
    #@event.persons << @persons
    # Replace @event.persons
    @event.persons = @persons
    
    
    
    puts "Prams are:::::::::::::::::::::"
    #Rails.logger.debug params.inspect
    #puts params[:participating_people]

    #puts participating_params
    #raise params.inspect

    #puts event_params
    puts "=======================>"
    puts "Participating params ===> #{participating_params}"
    
    puts "Params were::::::::::::::::::"

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

    # Replace @event.persons with this new value
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
    params.require(:event).permit(:name, :location, :participating_people => [])
  end

  private
  def participating_params
    #params.permit(:participating_people => [])
    params.permit(:participating_people => [])
    #params.require(:event).permit(:participating_people)
    #params.require(:event).permit(:name, :location, :participating_people)
  end
end
