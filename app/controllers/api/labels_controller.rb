class Api::LabelsController < ApplicationController
  def final
    # name = params[:name]
    # hex = params[:hex]
    @result = ""
    @result += add_character("Sylvie", "333333")
    @result += add_label("meadow")
    @result += add_scene("school", "fade")
    @result += show_character("sylvie green smile")
    @result += dialogue("s", "Hi, I'm Sylvie!")
    @result += menu("lunch", "Where should we eat?", "Grab a burger", "burger", "Get tacos", "tacos")

    render 'final.json.jbuilder'
  end

  def index
    @labels = Label.all
    render 'index.json.jbuilder'
  end

  def show
    @label = Label.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    p "Enter image name:"
    image_name = gets.chomp
    show(image_name)
    # @label = Label.new(
    #   name: params[:input_name]
    # )

    # @label.save

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

  def add_character(character, color_hex)
    final_result = ""
    @short_name = character[0].downcase
    final_result += "# Characters used in-game\n"
    final_result += "define #{character[0].downcase} = Character(_(\"#{character}\"), color=\"##{color_hex}\")"
    return final_result 
  end

  # def add_music(music_file)
  #   final_result = ""
  #   final_result += "play music \"#{music_file}\""
  # end

  def add_scene(background, transition)
    final_result = ""
    final_result += "scene bg #{background}\n"
    final_result += "with #{transition}\n"
  end

  def add_label(label_name)
    final_result = ""
    final_result += "label #{label_name.downcase}\n"
  end

  def dialogue(short_name, narration)
    final_result = ""
    final_result += "\t#{short_name} #{narration}\n"
  end

  def menu(menu_name, intro_text, choice1, label1, choice2, label2)
    final_result = ""
    final_result += "\tmenu #{menu_name}\n"
    final_result += "\t\t#{intro_text}\n"
    final_result += "\t\t#{choice1}\n"
    final_result += "\t\t\tjump #{label1}\n"
    final_result += "\t\t#{choice2}\n"
    final_result += "\t\t\tjump #{label2}\n"
  end

  def show_character(image_name)
    final_result = ""
    final_result += "\tshow #{image_name}\n"
  end
end