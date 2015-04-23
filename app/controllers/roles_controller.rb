class RolesController < ApplicationController
    def index
      @roles = Role.all
    end

    def show
      @role = Role.find(params[:id])

      return @role
    end

    def new
      @role = Role.new
    end

    def edit
      @role = Role.find(params[:id])
    end

    def create
      @role = Role.new(role_params)

      if @role.save
        redirect_to @role
        flash[:success] = "Added successfully!"
      else
        render 'new'
      end

    end

    def update
      @role = Role.find(params[:id])

      if @role.update(role_params)
        redirect_to @role
        flash[:success] = "update successfully!"
      else
        render 'edit'
      end
    end

    def destroy
      @role = Role.find(params[:id])
      @role.destroy

      redirect_to roles_path
    end

   
    private
    def role_params
      params.require(:role).permit(:name, :description)
    end

  end
