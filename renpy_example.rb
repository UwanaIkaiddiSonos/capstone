
def add_character(character, color_hex)
  @short_name = character[0].downcase
  puts '# Characters used in-game'
  puts "define #{character[0].downcase} = Character(_(\"#{character}\"), color=\"##{color_hex}\")" 
end

# p "Enter a character name:"
# character = gets.chomp
# p "Enter a color:"
# color_hex = gets.chomp

# add_character(character, color_hex)

# add_character("Sylvia", "ffffff")

# add_character("Melanie", "09f56a")

def add_music(music_file)
  puts "play music \"#{music_file}\""
end

# p "Enter music file name"
# music_file = gets.chomp

# add_music(music_file)

def add_scene(background, transition)
  puts "scene bg #{background}"
  puts "with #{transition}"
end

# add_scene("meadow", "fade")

def add_label(label_name)
  puts "label #{label_name.downcase}"
end

# add_label("Meadow")

def dialogue(short_name, narration)
  puts "#{short_name}: #{narration}"
end

# narration = "Hello there!"
# dialogue(@short_name, narration)

def menu(menu_name, intro_text, choice1, label1, choice2, label2)
  puts "menu #{menu_name}"
  puts "\t#{intro_text}"
  puts "\t#{choice1}"
  puts "\t\tjump #{label1}"
  puts
  puts "\t#{choice2}"
  puts "\t\tjump #{label2}"
end

# p "Enter menu name:"
# menu_name = gets.chomp
# p "Intro:"
# intro_text = gets.chomp
# p "Choce 1:"
# choice1 = gets.chomp
# p "Enter label:"
# label1 = gets.chomp
# p "Choice 2"
# choice2 = gets.chomp
# p "Label 2:"
# label2 = gets.chomp

# menu(menu_name, intro_text, choice1, label1, choice2, label2)

def show(image_name)
  puts "show #{image_name}"
end

p "Enter image name:"
image_name = gets.chomp

show(image_name)