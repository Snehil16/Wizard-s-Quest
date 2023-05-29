require_relative 'room'

class Game
  def initialize
    @rooms = {}
    setup_rooms
  end

  def setup_rooms
    @rooms[:diagon_alley] = Room.new(:diagon_alley, <<~DESCRIPTION)
      Diagon Alley:
      Begin your journey in the bustling wizarding marketplace of Diagon Alley. Visit Ollivander's Wand Shop, Flourish and Blotts bookstore, and other magical shops to gather supplies, acquire your wand, and learn about your mission.
    DESCRIPTION

    @rooms[:hogwarts_express] = Room.new(:hogwarts_express, <<~DESCRIPTION)
      Hogwarts Express:
      Board the Hogwarts Express, a magical train that transports students to Hogwarts School of Witchcraft and Wizardry. Interact with fellow students, solve puzzles, and uncover hidden passages on the train.
    DESCRIPTION

    @rooms[:hogwarts_school] = Room.new(:hogwarts_school, <<~DESCRIPTION)
      Hogwarts School:
      Explore the majestic halls, classrooms, and common rooms of Hogwarts School. Attend magical classes, interact with professors and students, solve riddles, and uncover secrets hidden within the castle's walls.
    DESCRIPTION

    @rooms[:forbidden_forest] = Room.new(:forbidden_forest, <<~DESCRIPTION)
      Forbidden Forest:
      Venture into the mysterious Forbidden Forest, home to magical creatures and hidden treasures. Navigate through the dense trees, encounter dangerous creatures, and solve nature-based puzzles to discover ancient artifacts.
    DESCRIPTION

    @rooms[:triwizard_tournament] = Room.new(:triwizard_tournament, <<~DESCRIPTION)
      Triwizard Tournament:
      Participate in the thrilling Triwizard Tournament, a prestigious magical competition held between Hogwarts and other wizarding schools. Face challenging tasks, solve intricate puzzles, and compete against skilled opponents to prove your worth.
    DESCRIPTION

    @rooms[:ministry_of_magic] = Room.new(:ministry_of_magic, <<~DESCRIPTION)
      Ministry of Magic:
      Journey to the heart of wizarding government, the Ministry of Magic. Navigate through its labyrinthine corridors, uncover political intrigue, and confront dark forces seeking to disrupt the wizarding world's peace.
    DESCRIPTION
  end

  def start
    current_room = @rooms[:diagon_alley]

    loop do
      current_room.describe

      # Prompt the user for action
      print "Enter your action: "
      action = gets.chomp.downcase.strip
      puts "\n"


      # Perform action based on the current room
      case current_room.name
      when :diagon_alley
        if action == "visit wand shop"
          puts "You enter Ollivander's Wand Shop and find the perfect wand for your magical journey."
          current_room = @rooms[:hogwarts_express]
        elsif action == "visit bookstore"
          puts "You browse through the shelves of Flourish and Blotts, finding valuable books for your studies."
          current_room = @rooms[:hogwarts_express]
        else
          puts "Invalid action! Try again."
        end
      when :hogwarts_express
        if action == "interact with students"
          puts "You strike up conversations with fellow students and make new friends for the journey to Hogwarts."
          current_room = @rooms[:hogwarts_school]
        elsif action == "solve puzzles"
          puts "By solving intricate puzzles on the train, you uncover hidden compartments and secrets."
          current_room = @rooms[:hogwarts_school]
        else
          puts "Invalid action! Try again."
        end
      when :hogwarts_school
        if action == "attend classes"
          puts "You attend magical classes, learning spells, potions, and other essential skills."
          current_room = @rooms[:forbidden_forest]
        elsif action == "explore common room"
          puts "You spend time in your house's common room, socializing with fellow students and relaxing."
          current_room = @rooms[:forbidden_forest]
        else
          puts "Invalid action! Try again."
        end
      when :forbidden_forest
        if action == "venture deeper"
          puts "You bravely explore the depths of the Forbidden Forest, encountering magical creatures and uncovering hidden artifacts."
          current_room = @rooms[:triwizard_tournament]
        elsif action == "solve puzzles"
          puts "By solving intricate puzzles related to nature, you discover ancient artifacts and unlock their powers."
          current_room = @rooms[:triwizard_tournament]
        else
          puts "Invalid action! Try again."
        end
      when :triwizard_tournament
        if action == "participate in tasks"
          puts "You take part in thrilling tasks of the Triwizard Tournament, showcasing your magical abilities and courage."
          current_room = @rooms[:ministry_of_magic]
        elsif action == "compete against opponents"
          puts "Facing skilled opponents, you engage in magical duels and demonstrate your prowess."
          current_room = @rooms[:ministry_of_magic]
        else
          puts "Invalid action! Try again."
        end
      when :ministry_of_magic
        if action == "navigate corridors"
          puts "You navigate the labyrinthine corridors of the Ministry of Magic, uncovering secrets and combating dark forces."
          current_room = @rooms[:diagon_alley]
        elsif action == "confront dark forces"
          puts "You confront dark forces threatening the wizarding world, using your skills to protect those in need."
          current_room = @rooms[:diagon_alley]
        else
          puts "Invalid action! Try again."
        end
      end

      puts "\n"
    end
  end
end
