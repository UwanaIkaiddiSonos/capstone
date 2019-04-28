class Api::CharactersController < ApplicationController
  def index
  # Testing the print
    puts "START\n
    define s = Character(_('Sylvie'), color='#c8ffc8')\n
    define m = Character(_('Me'), color='#c8c8ff')\n
    label start:\n
    \tplay music 'illurock.opus'\n
    \tscene bg lecturehall\n
    \twith fade\n
    \t\"It's only when I hear the sounds of shuffling feet and supplies being put away that I realize that the lecture's over.\"\n
    \t\"Professor Eileen's lectures are usually interesting, but today I just couldn't concentrate on it.\"\n
    \t\"I've had a lot of other thoughts on my mind...thoughts that culminate in a question.\"\n
    \t\"It's a question that I've been meaning to ask a certain someone.\"\n
    \tscene bg uni\n
   \twith fade\n
   \t\"When we come out of the university, I spot her right away.\"\n
   \tshow sylvie green normal\n
   \twith dissolve\n
   \t\"I've known Sylvie since we were kids. She's got a big heart and she's always been a good friend to me.\"\n
   \t\"But recently... I've felt that I want something more.\"\n
   \t\"More than just talking, more than just walking home together when our classes end.\"\n
   \tmenu:\n
   \t\t\"As soon as she catches my eye, I decide...\"\n
   \t\t\"To ask her right away.\":\n
   \t\t\tjump rightaway\n
   \t\t\"To ask her later.\":\n
   \t\t\tjump later"

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