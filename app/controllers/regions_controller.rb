class RegionsController < BaseController
  expose :regions
  expose :region, build_params: :region_params
  expose :country

  def create
    if region.save
      redirect_to country_region_path(country, region)
    else
      redirect_to new_country_region_path(country)
    end
  end

  def update
    if region.save
      redirect_to country_region_path(country, region)
    else
      redirect_to edit_country_region_path(country, region)
    end
  end

  def destroy
    region.destroy(params[:id])
    redirect_to country_regions_path(country)
  end

  private

  def region_params
    params.require(:region).permit(:name, :country_id, birds_ids: [] )
  end
end
