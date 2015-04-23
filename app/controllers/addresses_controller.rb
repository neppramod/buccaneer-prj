  class AddressesController < ApplicationController
    def index
      @addresses = Address.all
    end

    def show
      @address = Address.find(params[:id])

      return @address
    end

    def new
      @address = Address.new
    end

    def edit
      @address = Address.find(params[:id])
    end

    def create
      @address = Address.new(address_params)

      if @address.save
        redirect_to @address
        flash[:success] = "Added successfully!"
      else
        render 'new'
      end

    end

    def update
      @address = Address.find(params[:id])

      if @address.update(address_params)
        redirect_to @address
        flash[:success] = "updated successfully!"
      else
        render 'edit'
      end
    end

    def destroy
      @address = Address.find(params[:id])
      @address.destroy

      redirect_to addresses_path
    end

   
    private
    def address_params
      params.require(:address).permit(:street, :city, :state, :county, :zip, :address_type)
    end

  end
