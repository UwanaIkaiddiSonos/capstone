class Api::DraftsController < ApplicationController
  # def create
  #   @draft = Draft.new(
  #     first_name: params[:input_first_name],
  #     color: params[:input_color]
  #   )

  #   @draft.save
  #   #render 'show.json.jbuilder'
  # end
  def convert
    first_name = params[:input_first_name]
    color = params[:input_color]
    label = params[:input_label_name]
    scene = params[:input_scene_name]
    transition = params[:input_transition_name]

    @result = ""
    @result += add_character(first_name, color)
    # @result += add_character("Sylvie", "#000000")
    @result += add_label(label)
    @result += add_scene(scene, transition)
    @result += show_character("sylvie green smile")
    @result += dialogue("s", "Hi, I'm Sylvie!")
    @result += menu("lunch", "Where should we eat?", "Grab a burger", "burger", "Get tacos", "tacos")

    render 'convert.json.jbuilder'
  end

  # Unrendered methods
  def add_character(character, color_hex)
    final_result = ""
    @short_name = character[0].downcase
    final_result += "# Characters used in-game\n"
    final_result += "define #{character[0].downcase} = Character(_(\"#{character}\"), color=\"#{color_hex}\")\n"
    return final_result 
  end

  def add_label(label_name)
    final_result = ""
    final_result += "label #{label_name}\n"
  end

  def add_scene(background, transition)
    final_result = ""
    final_result += "scene bg #{background}\n"
    final_result += "with #{transition}\n"
  end

  def add_music(music_file)
    final_result = ""
    final_result += "play music \"#{music_file}\""
  end

  def show_character(image_name)
    final_result = ""
    final_result += "\tshow #{image_name}\n"
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
end
