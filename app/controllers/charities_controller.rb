class CharitiesController < ApplicationController
  before_action :set_charity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @charities = Charity.all
  end

  def show
  end

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    if @charity.save
      redirect_to charities_path, notice: "charity was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @charity.update(charity_params)
      redirect_to charities_path, notice: "charity was successfully updated."
    else
      render :new
    end
  end

  def destroy
    @charity.destroy
    redirect_to charities_path, notice: "charity was successfully deleted."
  end

  private

  def set_charity
    @charity = Charity.find(param[:id])
  end

  def charity_params
    params.require(:charity).permit(:name, :location, :description)
  end

end
