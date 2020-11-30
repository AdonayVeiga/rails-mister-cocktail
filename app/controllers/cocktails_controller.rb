class CocktailsController < ApplicationController
  # before_action :get_cocktail, only: %i[edit update show destory]

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params.require(:cocktail).permit(:name))
    if @cocktail.save
      flash[:success] = 'Cocktail successfully created'
      redirect_to @cocktail
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end
end
