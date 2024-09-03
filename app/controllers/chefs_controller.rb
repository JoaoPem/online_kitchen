class ChefsController < ApplicationController

  before_action :set_chef, only: [:show, :edit, :update]

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Welcome #{@chef.name} to my recipes app!"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @chef.update(chef_params)
      flash[:succcess] = "Yout account was updated successfully!"
      redirect_to @chef
    else
      render 'edit'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :email, :password,  :password_confirmation)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end
end