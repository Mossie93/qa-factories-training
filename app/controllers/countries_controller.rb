class CountriesController < BaseController
  expose :countries, ->{ Country.all }
  expose :country, build_params: :country_params

  def create
    if country.save
      redirect_to country_path(country)
    else
      redirect_to new_country_path
    end
  end

  def update
    if country.update(country_params)
      redirect_to country_path(country)
    else
      redirect_to edit_country_path(country)
    end
  end

  def destroy
    country.destroy(params[:id])
    redirect_to countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
