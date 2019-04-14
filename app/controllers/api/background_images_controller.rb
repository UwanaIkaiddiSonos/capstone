class Api::BackgroundImagesController < ApplicationController
  def index
    @background_images = BackgroundImage.all
    render 'index.json.jbuilder'
  end

  def show
    @background_image = BackgroundImage.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @background_image = BackgroundImage.new(
      url: params[:input_url]
    )
    @background_image.save
    render 'show.json.jbuilder'
  end

  def update
    @background_image = BackgroundImage.find_by(id: params[:id])

    @background_image.update(
      url: params[:input_url] || @background_image.url
    )
    render 'show.json.jbuilder'
  end

  def destroy
    @background_image = BackgroundImage.find_by(id: params[:id])
    @background_image.destroy
    render "destroy.json.jbuilder"
  end
end
