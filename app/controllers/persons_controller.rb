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
    
    # Lets first destroy all associated addresses
    # Just a workaround (TODO: Fixme)
    #@person.addresses.each do |a|
    #    a.destroy
    #end
    
    #@person.addresses.destroy_all
    @addresses = @person.addresses
    #@addresses.destroy_all


    
    #role part
     @roles = []

    user_params = person_params
    @address_attributes = user_params[:addresses_attributes]


    #@address_attributes.shift
    #@address_attributes.shift

    #print(@address_attributes)

    user_params[:addresses_attributes] = @address_attributes
    @addresses.destroy_all

    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]


    participatingpeoplevalues.each do |pv|
      @role = Role.where(:_id => pv).first
      @roles.push(@role)
    end
       @person.roles = @roles

    #if @person.update(person_params)
    if @person.update(user_params)
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
