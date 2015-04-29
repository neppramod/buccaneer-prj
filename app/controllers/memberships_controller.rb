class MembershipsController < ApplicationController

  def index
    	@memberships = Membership.all
  end

  def show
    @membership = Membership.find(params[:id])

    @membership.persons.each do |p|
      puts "Displaying user's membership => #{p.first_name}"
    end

    return @membership
  end

  def new
  	@membership = Membership.new
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def create
  	    @membership = Membership.new(membership_params)
    
    @persons = []

    
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]
    puts "I am saying something here"

    # Doners cannot work without null donations, still to prevent error, allowed null
    if participatingpeoplevalues
      participatingpeoplevalues.each do |pv|
        @person = Person.where(:_id => pv).first
        puts "THis person's name is #{@person.first_name}"
        @persons.push(@person)
      end      
    end
    
    # Replace @donation.persons
    @membership.persons = @persons
    

    if @membership.save
      redirect_to @membership
      flash[:success] = "Added successfully!"
    else
      render 'new'
    end
  end

  def update
    @membership = Membership.find(params[:id])

     @persons = []

    participatingkv = participating_params
    participatingkvuservalues = participatingkv[:participating_people]

    #@persons << Person.where(:_id => participatingkvuservalues).first

    if participatingkvuservalues
      participatingkvuservalues.each do |pv|
        @person = Person.where(:_id => pv).first
        #puts "THis person's name is #{@person.name}"
        @persons.push(@person)
      end      
    end
      
    @membership.persons = @persons

    if @membership.update(membership_params)
      redirect_to @membership
      flash[:success] = "Updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    redirect_to memberships_path
  end

  private
  def membership_params
  	params.require(:membership).permit( :lvl, :amt, :participating_people => [])
  end

  private
  def participating_params
    params.permit(:participating_people => [])
  end
end
