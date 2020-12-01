class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    new_dose = Dose.new(dose_params)
    cocktail = Cocktail.find(params[:cocktail_id])

    new_dose.cocktail_id = cocktail.id
    new_dose.save

    redirect_to cocktail_path(cocktail)
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy

    redirect_to session.delete(:return_to)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
