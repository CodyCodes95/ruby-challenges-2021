# Lets play pokeymans.
# We have our very own pokeymans that we have to take care of.

# SECTION ONE - EASY

# PART ONE - CREATING THE GAME LOOP

# I want to create a loop that will give me the option to train, catch or take care of my pokeymans.
# Each one of these actions count as one cycle of my loop. I want to be given the option of what action I want to do each cycle.

# PART TWO - INITIALIZE

# Each pokeymans I catch has a name, health, level, experience, happiness, hunger.
# Maximum health points start out as a random number between 60 and 100.
# Level starts at 5...for now.
# Experience starts at 0.
# Happiness at 100 out of 100
# Hunger at 0 out of 100.

# PART THREE - FIRST INSTANCE

# I start with 1 pokeyman and his name is Larry. Let's focus on Larry first before we start catching more pokeymans.
# For now, each cycle will only affect Larry.

# PART FOUR - INSTANCE METHODS & THE PASSAGE OF TIME

# Training my pokeymans will increase their experience by a little and eventually they will level up.
# Leveling up will increase their level by one and their maximum health
# Training will also decrease their happiness. If it gets to 0 then they won't train :(
# I can play with my pokeymans which will increase their happiness.
# Playing or training with my pokeymans will increase their hunger, if their hunger gets too high they lose health points and happiness.
# Feeding my pokeymans will decrease their hunger.
# Update our game loop so that each cycle, all of our pokeymans gain a bit of hunger
# While a pokeymans hunger is low, they will regain health points each cycle

# If a pokeymans health reaches zero, it dies.

# END OF SECTION ONE

# SECTION TWO - MEDIUM
# PART ONE - OTHER POKEYMANS

# Now I want to find and catch and battle with other pokeymans.
# I can only have 6 pokeymans at a time, if I catch another over 6 I have to let him go :(
# Lets keep it simple for now, each cycle will introduce random encounter with a unnamed pokeyman that is level 5

# If we decide to fight it, we gain a lot more experience but lose hp.
# How much do we lose? Lets say we lose the other pokeymans level multiplied by a random number between 0 and 5.

# If we decide to catch it then we add it to our caught pokeymans, and this will create a new instance of Pokeymans
# Catching a pokeymans will increase a count of caught pokeymans by one, remember this cant go higher than 6.

# Now that we have more than one caught pokeymans, we need to change our loop to ask which pokeymans we are training/taking care of.

require 'json'

class Pokemanz
    attr_accessor :name, :health, :level

    @@party = []

    def initialize(name, health = rand(60..100), level = 5, max_health = (level + health), experience = 0, happiness = 100, hunger = 0, next_level = 10)
        @name = name
        @health = health
        @level = level
        @max_health = max_health
        @experience = experience
        @happiness = happiness
        @hunger = hunger
        @next_level = next_level
        @@party.push(self) if @name != "unnamed"
    end

    def self.party
        return @@party
    end

    def cycle(party)
        @hunger += 1
        if @hunger < 5
            @health += 5
            @health = @max_health if @health > @max_health
        else
            @health -= 5
            @health = 0 if @health < 0
            @happiness -= 5
            @happiness = 0 if @happiness < 0
        end
        @hunger = 100 if @hunger > 100
        @happiness = 100 if @happiness > 100
        puts "Pokemanz dead :(" if @health < 0
        puts "Health #{@health} out of #{@max_health} Happiness #{@happiness} Hunger #{@hunger} Level #{@level} Experience #{@experience}"
        puts "A wild pokeman appeared!"
        wild_pokeman = Pokemanz.new("unnamed")
        puts "What would you like to do?"
        puts "1. Fight"
        puts "2. Catch"
        input = gets.chomp.to_i
        if input == 1
            fight(Pokemanz.party, wild_pokeman)
        elsif input == 2
            catch(party, wild_pokeman)
        end
    end

    def train
        if @happiness <= 0
            puts "#{@name} Is too unhappy to train"
        else
            @happiness -= 5
            @experience += 1
            if @experience >= @next_level
                @level += 1
                @experience = 0
                @next_level += 1
                @hunger += 1
                if @hunger > 5
                    @health -= 5
                    @happiness -= 10
                end
            end
        end
    end

    def name_getter
        return :name
    end

    def play
        @happiness += 20
        @hunger += 1
        if @hunger > 5
            @health -= 5
            @happiness -= 10
        end
    end

    def feed
        if @hunger > 1
        @hunger -= 2
        else
            puts "#{@name} is not hungry"
        end
    end

    def catch(party, wild_poke)
        if party.length > 5
            puts "Your party is full. Would you like to?"
            puts "1. Let your caught pokeman go"
            puts "2. Release one of your pokeman to make room"
        else
            puts "Congragulations! You have caught the Pokeman!"
            puts "Please enter a name for your new Pokeman!"
            name = gets.chomp
            wild_poke.name = name
            party.push(wild_poke)
        end
    end

    def fight(_party, wild_poke)
        damage = (wild_poke.level * rand(0..5))
        if damage > @health
        puts "Pokemanz dead :("
        puts "Type anything to return"
        input = gets.chomp
        else
            puts "You have knocked out the wild Pokeman!"
            puts "10 experience gained, #{@health -= damage} HP lost"
            puts "Type anything to return"
            input = gets.chomp
            @experience += 10
            # next_level method
            @health -= damage
        end
    end

    def stats
        puts "Name: #{@name}"
        puts "Health: #{@health}"
        puts "Max Health: #{@max_health}"
        puts "Level: #{@level}"
        puts "Experience: #{@experience}"
        puts "Happiness: #{@happiness}"
        puts "Hunger: #{@hunger}"
        puts "XP until next level: #{@next_level}"
    end

    def self.to_json(party)
        party.map do |pokeman|
            pokeman.to_json
        end
    end

    def to_json(*_args)
        {
          name: @name,
          health: @health,
          level: @level,
          max_health: @max_health,
          experience: @experience,
          happiness: @happiness,
          hunger: @hunger,
          next_level: @next_level
        }
    end

    def self.from_json(pokemanz_party_json)
        pokemanz_party_json.each do |pokeman|
            Pokemanz.new(
              pokeman[:name],
              pokeman[:health],
              pokeman[:level],
              pokeman[:max_health],
              pokeman[:experience],
              pokeman[:happiness],
              pokeman[:hunger],
              pokeman[:next_level]
            )
        end
    end
end

system "clear"
party_file = JSON.load_file('pokemanz.json', symbolize_names: true)
Pokemanz.from_json(party_file)
if Pokemanz.party.length == 0
    puts "Give your first pokeman a name"
    name = gets.chomp
    Pokemanz.new(name)
end
current_pokeman = Pokemanz.party[0]
# THIS IS HOW TO GET HUNGER IF ITS IN A GETTER. HOW TO DO WITHOUT GETTER????
# p current_pokeman.hunger
quit = false
while quit == false
    system "clear"
    # p current_pokeman
    # p party_file
    # p Pokemanz.party
    puts "Welcome to the Pokemanz app!"
    puts "What would you like to do?"
    puts "1. Train"
    puts "2. Care"
    puts "3. Pick current Pokeman"
    puts "4. View Stats"
    puts "5. Quit"
    input = gets.chomp.to_i
    case input
    when 1
        train_menu = true
        while train_menu == true
            puts "What would you like to do"
            puts "1. Train"
            puts "2. Back"
            input = gets.chomp.to_i
            if input == 1
                current_pokeman.train
            elsif input == 2
                current_pokeman.cycle(Pokemanz.party)
                train_menu = false
            else
                puts "Invalid input"
            end
        end

    when 2
        care_menu = true
        while care_menu == true
            puts "What would you like to do?"
            puts "1. Play"
            puts "2. Feed"
            puts "3. Back"
            input = gets.chomp.to_i
            if input == 1
                play(current_pokeman)
            elsif input == 2
                feed(current_pokeman)
            elsif input == 3
                current_pokeman.cycle(Pokemanz.party)
                care_menu = false
            else
                puts "Invalid input"
            end

        end
    when 3
        party_menu = true
        while party_menu == true
            puts "Your current Pokeman is #{current_pokeman.name}"
            puts "Select which pokeman you would like to work with"
            Pokemanz.party.each_with_index do |pokeman, i|
                puts "#{i + 1} #{pokeman.name}"
            end
            puts "#{Pokemanz.party.length + 1}. Back"
            input = gets.chomp.to_i
            if input != Pokemanz.party.length + 1
            current_pokeman = Pokemanz.party[input - 1]
            elsif input == Pokemanz.party.length + 1
                party_menu = false
            else
                puts "Incorrect input"
            end
        end
    when 4
        stats_menu = true
        while stats_menu == true
        puts "Pick which pokeyman's stats you would like to view"
        Pokemanz.party.each_with_index do |pokeman, i|
                puts "#{i + 1} #{pokeman.name}"
        end
        puts "#{Pokemanz.party.length + 1} Back"
        input = gets.chomp.to_i
        if input != Pokemanz.party.length + 1
            current_pokeman = Pokemanz.party[input - 1]
            puts current_pokeman.stats
        elsif input == Pokemanz.party.length + 1
            stats_menu = false
        else
            puts "Incorrect input"
        end
        end
    when 5
        quit = true
        File.write('pokemanz.json', JSON.pretty_generate(Pokemanz.to_json(Pokemanz.party)))
    end
end
