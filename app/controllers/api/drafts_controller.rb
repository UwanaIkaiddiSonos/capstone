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
    # first_name = params[:input_first_name]
    # short_name = first_name[0].downcase
    # color = params[:input_color]
    # label = params[:input_label_name]
    # p label
    # scene = params[:input_scene_name]
    # transition = params[:input_transition_name]
    # dialogue = params[:input_dialogue]
    # menu = params[:input_menu]
    # intro = params[:input_intro]
    # choice1_label = params[:input_choice1_label]
    # choice1 = params[:input_choice1]
    # choice2_label = params[:input_choice2_label]
    # choice2 = params[:input_choice2]
    inputs = params[:fieldInputs]

    @result = ""
    inputs.each do |input|
      if input['type'] == 'Label'
        @result += add_label(input["userInput"])
      elsif input['type'] == 'Dialogue'
        @result += dialogue(input['character'][0].downcase, input['userInput'])
      elsif input['type'] == 'Menu'
        @result += menu(input['intro'], input['choice1'], input['choice1_label'], input['choice2'], input['choice2_label'])
      elsif input['type'] == 'Scene'
        @result += add_scene(input['userInput'])
      elsif input['type'] == 'Transition'
        @result += add_transition(input['userInput'])
      elsif input['type'] == 'Character'
        @result += add_character(input['userInput'], input['color'])
      end
    end

    # @result += show_character("sylvie green smile")

    render 'convert.json.jbuilder'
  end

  # Unrendered methods
  def add_character(character, color_hex)
    final_result = ""
    if character[0] != " "
      @short_name = character[0].downcase
      final_result += "define #{character[0].downcase} = Character(_(\"#{character}\"), color=\"#{color_hex}\")\n"      
    end
    return final_result 
  end

  def add_label(label_name)
    final_result = ""
    final_result += "label #{label_name}:\n"
    return final_result
  end

  def add_scene(background)
    final_result = ""
    final_result += "\tscene bg #{background}\n"
    return final_result
  end

  def add_transition(transition)
    final_result = ""
    final_result += "\twith #{transition}\n" 
    return final_result
  end

  # def add_music(music_file)
  #   final_result = ""
  #   final_result += "play music \"#{music_file}\""
  # end

  # def show_character(image_name)
  #   final_result = ""
  #   final_result += "\tshow #{image_name}\n"
  # end

  def dialogue(short_name, narration)
    final_result = ""
    if narration != " "
      final_result += "\t#{short_name} \"#{narration}\"\n"
    end
    return final_result
  end

  def menu(intro_text, choice1, label1, choice2, label2)
    final_result = ""
    final_result += "\tmenu:\n"
    final_result += "\t\t\"#{intro_text}\"\n"
    final_result += "\t\t\"#{choice1}\":\n"
    final_result += "\t\t\tjump #{label1}\n"
    final_result += "\t\t\"#{choice2}\":\n"
    final_result += "\t\t\tjump #{label2}\n"
    return final_result
  end
end
