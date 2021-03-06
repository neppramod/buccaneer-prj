class InterestsController < ApplicationController
  def index
    @interests =Interest.all
  end

  def show
    @interest = Interest.find(params[:id])

    @persons = Person.all

    @pp = []

     @persons.each do |p| 
    	p.interests.each do |i| 
    	  if i.name ==  @interest.name
    	  puts "Show is showing a showey person Interest => #{i.name}"
    	  @pp.push(p) 
    	  end
    	end
    end	  
    return @PP	
    	  	 
  end



  def new
    @interest = Interest.new
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def create
    @interest = Interest.new(interest_params)
    
      

    if @interest.save
      redirect_to @interest
      flash[:success] = "Added successfully!"
    else
      render 'new'
    end

  end

  def update
    @interest = Interest.find(params[:id])

   
    if @interest.update(interest_params)
      redirect_to @interest
      flash[:success] = "update successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    redirect_to interests_path
  end

  private
  def interest_params
    params.require(:interest).permit(:name, :description)
  end

end
