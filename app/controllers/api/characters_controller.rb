class Api::CharactersController < ApplicationController
  def index
    @characters = Character.all
    render 'index.json.jbuilder'
  end

  def show
    @character = Character.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @character = Character.create(
      first_name: params[:input_first_name],
      last_name: params[:input_last_name],
      color: params[:input_color]
    )
    render 'create.json.jbuilder'
  end

  def update
    
  end

  def destroy
    
  end
end
