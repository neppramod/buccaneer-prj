class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])

    @school.persons.each do |p|
      
    end

    return @school
  end

  def new
    @school = School.new
  end

  def edit
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(event_params)
    
    @persons = []

    
    participatingkv = participating_params
    participatingpeoplevalues = participatingkv[:participating_people ]

    # Doners cannot work without null donations, still to prevent error, allowed null
    if participatingpeoplevalues
      participatingpeoplevalues.each do |pv|
        @person = Person.where(:_id => pv).first
        @persons.push(@person)
      end      
    end
    
    # Replace @donation.persons
    @school.persons = @persons

      if @school.save
        flash[:success] = "Added successfully!"
      redirect_to @school
    else
      render 'new'
    end

  end

  def update
    @school = School.find(params[:id])

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

    if @school.update(event_params)
      flash[:success] = "update successfully!"
      redirect_to @school
    else
      render 'edit'
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    redirect_to schools_path
  end

  private
  def event_params
    params.require(:school).permit(:SchoolName, :ContactNumber,:street,:city, :state,:county,:zip, :participating_people => [])
  end

  private
  def participating_params
    params.permit(:participating_people => [])
  end

end
