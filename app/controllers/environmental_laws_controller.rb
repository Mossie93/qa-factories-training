class EnvironmentalLawsController < ApplicationController
  expose :environmental_law, build_params: :environmental_law_params
  expose :country

  def create
    if environmental_law.save
      redirect_to country_environmental_law_path(country, environmental_law)
    else
      redirect_to new_country_environmental_law_path(country)
    end
  end

  def update
    if environmental_law.save
      redirect_to country_environmental_law_path(country, environmental_law)
    else
      redirect_to edit_country_environmental_law_path(country, environmental_law)
    end
  end

  def destroy
    environmental_law.destroy(params[:id])
    redirect_to country_environmental_laws_path(country)
  end

  private

  def environmental_law_params
    params.require(:environmental_law).permit(:name, :country_id, :description, birds_ids: [] )
  end
end
