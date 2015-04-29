class EducationsController < ApplicationController
  def index
    @educations = Education.all
  end

  def show
    @education = Education.find(params[:id])

    @persons = Person.all

    @pp = []

     @persons.each do |p| 
      p.educations.each do |i| 
        if i.educationlevel ==  @education.educationlevel
        puts "Show is showing a showey person Interest => #{i.educationlevel}"
        @pp.push(p) 
        end
      end
    end   
    return @PP  
  end

  def new
    @education = Education.new
  end

  def edit
    @education = Education.find(params[:id])
  end

  def create
    @education = Education.new(education_params)
    
   
    if @education.save
      redirect_to @education
      flash[:success] = "Added successfully!"
    else
      render 'new'
    end

  end

  def update
    @education = Education.find(params[:id])

  
    if @education.update(education_params)
      redirect_to @education
      flash[:success] = "update successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy

    redirect_to educations_path
  end

  private
  def education_params
    params.require(:education).permit(:educationlevel)
  end

end
