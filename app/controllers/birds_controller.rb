class BirdsController < ApplicationController
  expose :birds, ->{ Bird.all }
  expose :bird, build_params: :bird_params

  def create
    if bird.save
      redirect_to bird_path(bird)
    else
      redirect_to new_bird_path
    end
  end

  def update
    if bird.update(bird_params)
      redirect_to bird_path(bird)
    else
      redirect_to edit_bird_path(bird)
    end
  end

  def destroy
    bird.destroy(params[:id])
    redirect_to birds_path
  end

  private

  def bird_params
    params.require(:bird).permit(:name, :latin_name, :description, region_ids: [])
  end
end
