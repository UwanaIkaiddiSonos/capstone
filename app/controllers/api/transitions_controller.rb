class Api::TransitionsController < ApplicationController
  def index
    @transitions = Transition.all
    render 'index.json.jbuilder'
  end

  def show
    @transition = Transition.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @transition = Transition.new(
      name: params[:input_name]
    )
    @transition.save
    render 'show.json.jbuilder'
  end

  def update
    @transition = Transition.find_by(id: params[:id])

    @transition.update(
      url: params[:input_name] || @transition.name
    )
    render 'show.json.jbuilder'
  end

  def destroy
    @transition = Transition.find_by(id: params[:id])
    @transition.destroy
    render "destroy.json.jbuilder"
  end
end
