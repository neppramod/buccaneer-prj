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

    @addresses = []

   @expertises = []
   temp_address = temporary_address_params[:temporary_address_select]

#@person.addresses = nil


    if (temp_address != '')
      #@addresses.push(Address.where(:_id => temp_address))
      #tmp_addr = Address.where(:_id => temp_address).first
      tmp_addr = Address.find_by id: temp_address
      #tmp_addr = Address.find(params[tmp_addr])
      #@person.addresses.push(tmp_addr)
      @addresses << tmp_addr
      #@person.addresses[0] = tmp_addr
    end



    perm_address = perm_address_params[:permanent_address_select]

    if (perm_address != '')
      #@addresses.push(Address.where(:_id => perm_address))
      #@person.addresses.push(Address.where(:_id => perm_address))
      #prm_addr = Address.where(:_id => perm_address).first
      prm_addr = Address.find_by id: perm_address
      #@person.addresses.push(prm_addr)
      @addresses << prm_addr
      #@person.addresses[1] = prm_addr
    end

    if @addresses.size == 2
      @person.addresses = @addresses
    end

    #@person.addresses = @addresses

    
    participatingkv = expertise_params
    participatingpeoplevalues = participatingkv[:people_expertise ]

    participatingpeoplevalues.each do |pv|
      @expertise = Expertise.where(:_id => pv).first
      @expertises.push(@expertise)
    end
       @person.expertises = @expertises


     # Interest

    @interests = []

    
    participatingkv = interest_params
    participatingpeoplevalues = participatingkv[:people_interest ]

    participatingpeoplevalues.each do |pv|
      @interest = Interest.where(:_id => pv).first
      @interests.push(@interest)
    end
    
    @person.interests = @interests


       # Education

    @educations = []

    
    participatingkv = education_params
    participatingpeoplevalues = participatingkv[:people_education ]

    participatingpeoplevalues.each do |pv|
      @education = Education.where(:_id => pv).first
      @educations.push(@education)
    end
    
    @person.educations = @educations
   



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

    #@address_attributes.each do |index, addr_attr|
    #  @address_attributes[index.to_i][:_id] = @addresses[index.to_i]
    #end
    #@address_attributes[0][:_id] = []
    #@address_attributes[0][:_id].push(@addresses[0])
    #@address_attributes[1][:_id] = '345'

    #@address_attributes[0][:_id] = @addresses[0][:_id]
    #@address_attributes[1][:_id] = @addresses[1][:_id]
    #@address_attributes

    #@updated_address = []
    #@updated_address << @addresses[0].update_attributes(@address_attributes[0])
    #@updated_address << @addresses[1].update_attributes(@address_attributes[1])

    @addresses[0].update_attributes(@address_attributes[0])
    @addresses[1].update_attributes(@address_attributes[1])


    user_params[:addresses_attributes] = @address_attributes
    #user_params[:addresses_attributes] = []
    #user_params[:addresses_attributes] = []
    #user_params.delete('address_attributes')


    @person.addresses = @addresses
    #@addresses.destroy_all
    #@person.addresses.destroy_all

    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]


    participatingpeoplevalues.each do |pv|
      @role = Role.where(:_id => pv).first
      @roles.push(@role)
    end
       @person.roles = @roles

    
    # Expertise

    @expertises = []

    
    participatingkv = expertise_params
    participatingpeoplevalues = participatingkv[:people_expertise ]

    participatingpeoplevalues.each do |pv|
      @expertise = Expertise.where(:_id => pv).first
      @expertises.push(@expertise)
    end
       @person.expertises = @expertises


    # Interest

    @interests = []

    
    participatingkv = interest_params
    participatingpeoplevalues = participatingkv[:people_interest ]

    participatingpeoplevalues.each do |pv|
      @interest = Interest.where(:_id => pv).first
      @interests.push(@interest)
    end
    
    @person.interests = @interests



    # Education

    @educations = []

    
    participatingkv = education_params
    participatingpeoplevalues = participatingkv[:people_education ]

    participatingpeoplevalues.each do |pv|
      @education = Education.where(:_id => pv).first
      @educations.push(@education)
    end
    
    @person.educations = @educations




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

 private
  def expertise_params
    params.permit(:people_expertise => [])
  end


 private
  def interest_params
    params.permit(:people_interest => [])
  end

 private
  def education_params
    params.permit(:people_education => [])
  end

private
  def temporary_address_params
    params.permit(:temporary_address_select)
  end

  private
  def perm_address_params
    params.permit(:permanent_address_select)
  end

end
