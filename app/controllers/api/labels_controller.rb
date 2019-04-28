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
    @short_name = character[0].downcase
    puts '# Characters used in-game'
    puts "define #{character[0].downcase} = Character(_(\"#{character}\"), color=\"##{color_hex}\")" 
  end

  def add_music(music_file)
    puts "play music \"#{music_file}\""
  end

  def add_scene(background, transition)
    puts "scene bg #{background}"
    puts "with #{transition}"
  end

  def add_label(label_name)
    puts "label #{label_name.downcase}"
  end

  def dialogue(short_name, narration)
    puts "#{short_name}: #{narration}"
  end

  def menu(menu_name, intro_text, choice1, label1, choice2, label2)
    puts "menu #{menu_name}"
    puts "\t#{intro_text}"
    puts "\t#{choice1}"
    puts "\t\tjump #{label1}"
    puts
    puts "\t#{choice2}"
    puts "\t\tjump #{label2}"
  end

  def show_character(image_name)
    puts "show #{image_name}"
  end
end