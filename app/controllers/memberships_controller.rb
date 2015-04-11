class MembershipsController < ApplicationController

  def index
    	@memberships = Membership.all
  end

  def show
    @membership = Membership.find(params[:id])

    @membership.persons.each do |p|
      puts "Displaying user's membership => #{p.name}"
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
    participatingkvpeoplevalues = participatingkv[:participating_people]
    puts "Lets make it happening"

    participatingkvuservalues.each do |uv|
      @person = Person.where(:_id => uv).first
      puts "User name is #{@person.name}"
      @perons.push(@person)
    end
    #@users = User.where(:id => enrollmembership_params)
    @membership.persons = @persons
    #puts "Inside Create"
  	if @membership.save
            redirect_to @membership
    else
        render 'new'
    end
  end

  def update
    @membership = Membership.find(params[:id])

    @persons = []
    participatingkv = participating_params
    participatingkvuservalues = participatingkv[:participating_people]

    participatingkvuservalues.each do |uv|
      @person = Person.where(:_id => uv).first
      puts "User's name is #{@user.fname}"
      @persons.push(@person)
    end

    @membership.persons = @persons

    if @membership.update(membership_params)
      redirect_to @membership
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
