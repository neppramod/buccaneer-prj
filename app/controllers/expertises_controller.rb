class ExpertisesController < ApplicationController
  def index
    @expertises = Expertise.all
  end

  def show
    @expertise = Expertise.find(params[:id])

    @persons = Person.all

    @pp = []

     @persons.each do |p| 
      p.expertises.each do |i| 
        if i.expertise ==  @expertise.expertise
        puts "Show is showing a showey person Interest => #{i.expertise}"
        @pp.push(p) 
        end
      end
    end   
    return @PP , @expertise 

  end

  def new
    @expertise = Expertise.new
  end

  def edit
    @expertise = Expertise.find(params[:id])
  end

  def create
   @expertise = Expertise.new(event_params)
    
   
    if @expertise.save
      redirect_to @expertise
      flash[:success] = "Added successfully!"
    else
      render 'new'
    end

  end

  def update
    @expertise = Expertise.find(params[:id])

   
    if @expertise.update(event_params)
      redirect_to @expertise
      flash[:success] = "update successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @expertise = Expertise.find(params[:id])
    @expertise.destroy

    redirect_to expertises_path
  end

  private
  def event_params
    params.require(:expertise).permit(:expertise)
  end

end
