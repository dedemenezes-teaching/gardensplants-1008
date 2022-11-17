class PlantTagsController < ApplicationController

  def new
    # FIND THE PLANT
    # /plants/:plant_id/plant_tags/new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # raise
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @tags.each do |tag|
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end

  # STRONG_PARAMS
  # WE NEED TRO AUTHORI"E INFORMATION COMING FROM THE FORM
  # TO CREATE A NEW INSTANCE
end
