class DosesController < ApplicationController
  before_action :find_cocktail, except: :destroy

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params.require(:dose).permit(:description))
    # @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id]) if params[:dose][:ingredient_id]
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
