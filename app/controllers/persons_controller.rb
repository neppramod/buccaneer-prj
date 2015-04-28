class PersonsController < ApplicationController

  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
    #@person_address = Address.find( @person.address)

    #return @event
  end

  def new
  	@person = Person.new
        @person.addresses.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
  	@person = Person.new(person_params)
    @roles = []

    
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]

    participatingpeoplevalues.each do |pv|
      @role = Role.where(:_id => pv).first
      @roles.push(@role)
    end
       @person.roles = @roles

  	if @person.save
            redirect_to @person
            flash[:success] = "Added successfully!"
    else
        render 'new'
    end
  end

  def update
    @person = Person.find(params[:id])

    #role part
     @roles = []

    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]

    participatingpeoplevalues.each do |pv|
      @role = Role.where(:_id => pv).first
      @roles.push(@role)
    end
       @person.roles = @roles

    if @person.update(person_params)
      redirect_to @person
      flash[:success] = "Updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to persons_path
  end

  private
  def person_params
  	params.require(:person).permit(:first_name, :middle_name, :last_name,:email,
      :primary_contact,:secondary_contact,
      addresses_attributes: [:street, :city, :state, :county, :zip, :address_type]                                
                                      )
  end


  private
  def participating_params
    params.permit(:participating_people => [])
  end
end
