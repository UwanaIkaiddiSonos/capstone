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
    @character = Character.new(
      first_name: params[:input_first_name],
      last_name: params[:input_last_name],
      color: params[:input_color]
    )

    @character.save
    render 'show.json.jbuilder'
  end

  def update
    @character = Character.find_by(id: params[:id])

    @character.update(
      first_name: params[:input_first_name] || @character.first_name,
      last_name: params[:input_last_name] || @character.last_name,
      color: params[:input_color] || @character.color
    )
    render 'show.json.jbuilder'
  end

  def destroy
    @character = Character.find_by(id: params[:id])
    @character.destroy
    render "destroy.json.jbuilder"
  end
end