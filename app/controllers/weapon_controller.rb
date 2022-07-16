class WeaponController < ApplicationController
  def index
    @weapon = Weapon.all
  end

  def new
  @weapon = Weapon.new
  end

  def create
    @weapon = Weapon.new(name: params[:weapon][:name], description: params[:weapon][:description], power_base: params[:weapon][:power_base], power_step: params[:weapon][:power_step], level: 0)
    if @weapon.save
      redirect_to weapon_path(@weapon)
    else
      render :new
    end 
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon = Weapon.destroy
    redirect_to weapon_path
  end

  private def weapon_params
    params.require(:weapon).permit(:name, :description, :power_base, :power_step, :level)
  end
end
