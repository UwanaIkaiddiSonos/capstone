class Api::LabelsController < ApplicationController
  def index
    @labels = Label.all
    render 'index.json.jbuilder'
  end

  def show
    @label = Label.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @label = Label.new(
      name: params[:input_name]
    )
    @label.save
    render 'show.json.jbuilder'
  end

  def update
    @label = Label.find_by(id: params[:id])

    @label.update(
      name: params[:input_name] || @label.name
    )
    render 'show.json.jbuilder'
  end

  def destroy
    @label = Label.find_by(id: params[:id])
    @label.destroy
    render "destroy.json.jbuilder"
  end
end