class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])

    @school.persons.each do |p|
      puts "Show is showing a showey person => #{p.name}"
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
    
      if @school.save
      redirect_to @school
    else
      render 'new'
    end

  end

  def update
    @school = School.find(params[:id])

    if @school.update(event_params)
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
    params.require(:school).permit(:SchoolName, :ContactNumber)
  end

end
