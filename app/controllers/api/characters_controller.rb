class Api::CharactersController < ApplicationController
  def index
    @characters = Character.all
    render 'index.json.jbuilder'
  end

  def create
    
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end
end
