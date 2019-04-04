
# Potential form fields for each RenPy term

#Character

  #RenPy syntax
  define :short_name = Character(_(":display_name"), color = :hex_color)

  #Fields ((form-field-type)user-view: field-input-name)
  (text) Character Name - :display_name
  (text) Character Nickname - :short_name
  (color) Character Name Color - :hex_color

#Labels
  
  #RenPy syntax
  label :label_name

  #Fields
  (text) Label Name - :label_name

#Background Music
  
  #RenPy syntax
  play music ":music_file"

  #Fields
  (file(?)) Music File - :music_file

#Background 

  #RenPy syntax
  scene bg :background_name
  with :transition

  #Fields
  (text) Background Image Name - :background_name
  (dropdown) Transition Type (optional) - :transition
  #Transition probably defaults to something if not specified - find out what and set as a default transition in the form.

#Dialogue

  #RenPY
  :short_name "Line of narration"
  :short_name "Second line of narration"
  :short_name "Another line of narration"

  #Fields
  (dropdown) Character Name (optional) - :short_name
  (text-multiline) Text - ":string"
  # Should create a new string line after every paragraph break (Enter key pushed -What does form read that input as? <br>?)
  # Character dropdown should have a narrator option for no name displayed during dialogue

#In-Game Menu (this will require more agruments in the full version, probably...)

  #RenPy syntax
  menu :menu_name 
    "Introductory decision text"
    "Choice 1": #Appears on the menu button on-screen
      jump :label1

    "Choice 2": # Appears on the menu-button on-screen
      jump :label2

  # # Example scenario:

  # menu chapter_1_places:

  #   "Where should I go?"

  #   "Go to class.":
  #     jump :go_to_class

  #   "Go to the bar.":
  #     jump :go_to_bar

  #   "Go to jail.":
  #     jump :go_to_jail

  #Fields
  (text) Menu Name - :menu_name
  (text) Decision intro - "string"
  # No limit on number of choices
  (text) Choices - "Choice text"
  (dropdown) Choice continues to... - :label_name

# Show

  #RenPy
  show :image_name

  #Fields
  (text) Image Name - :image_name