# Clifford Smith Jr. (born March 2, 1971),[2] better known by his stage name Method Man, is an American rapper,
# songwriter, record producer and actor. He is known as a member of the East Coast hip hop collective Wu-Tang Clan.

# He's asked you to build an app that outputs the details of his sick rhymes and the movies he's been in.
# Someone has done the ground work but its not very DRY. Using methods, refactor the existing code base.

# BEFORE cleaning up the code, take a moment to run the program to experience and understand what is happening.
NAME = "Method Man"

def album_outputs(album)
  puts "The album #{album[:title]} was released in #{album[:year]}, with a score of #{album[:score]}/5"
  puts "The song list of #{album[:title]} is:"
  album[:songlist].each { |song| puts song }
end

def film_output(film, menu)
  puts "#{NAME} starred in a #{menu == 'movie' ? 'movie' : 'television show'} called #{film[:title]} in #{film[:year]} as #{film[:role]}"
end
# def string_builder(hash)
#   str = ""
#   index = 0
#   hash[index].each do |key, value|
#     if key == [:title]
#     str += "#{index + 1}. #{value}"
#     index +=1
#     return str
#     end
#   end
# end

system "clear"
puts "Welcome to beats by method"
quit = false
until quit == true
  puts "What would you like to do?"
  puts "Options: 1. Discography, 2. Filmography, 3. Bio, 4. Exit"
  puts "Press either 1/2/3"
  input = gets.chomp
  system "clear"
  if input == "1"
    discography_menu = true
    while discography_menu == true
      puts "#{NAME} has studio and collaboritive work."
      puts "What would you like to do?"
      puts "Options: 1. Studio, 2. Collaborive, 3. Back, 4. Exit"
      puts "Press either 1/2/3/4"
      input = gets.chomp
      system "clear"
      if input == "1"
        # I did the hard work of putting it into a hash for you. You're welcome.
        studio_work = [{
          title: "Tical",
          year: 1994,
          songlist: ["Tical", "Biscuits", "Bring the Pain"],
          score: 4.5
        }, {
          title: "Tical 2000: Judgement Day",
          year: 1998,
          songlist: ["Judgement Day (Intro)", "Perfect World", "Cradle Rock"],
          score: 4
        }, {
          title: "Tical 0: The Prequel",
          year: 2004,
          songlist: ["The Prequel", "Say What", "What's Happenin'"],
          score: 3
        }, {
          title: "4:21... The Day After",
          year: 2006,
          songlist: ["The Meth Lab", "Is It Me", "Problem"],
          score: 4
        }, {
          title: "The Meth Lab",
          year: 2015,
          songlist: ["The Meth Lab", "Straight Gutta", "Bang Zoom"],
          score: 4.5
        }]
        albums_menu = true
        while albums_menu == true
          puts "Would you like to see more about one of these albums?."
          puts "What would you like to do?"
          puts "Options: 1. #{studio_work[0][:title]} 2. #{studio_work[1][:title]} 3. #{studio_work[2][:title]} 4. #{studio_work[3][:title]} 5. #{studio_work[4][:title]} 6. Back 7. Exit"
          puts "Press either 1/2/3/4/5/6/7"
          input = gets.chomp
          system "clear"
          if input != "6" && input != "7"
            album = (studio_work[(input.to_i - 1)])
            album_outputs(album)
          elsif input == "6"
            albums_menu = false
          elsif input == "7"
            discography_menu = false
            albums_menu = false
            quit = true
          end
        end
      elsif input == "2"
        # I did the hard work of putting it into a hash for you. You're welcome.
        collab_menu = true
        while collab_menu == true
          collab_work = [{
            title: "Blackout!",
            year: 1999,
            songlist: ["A Special Joint", "Blackout", "Mi Casa"],
            score: 4
          }, {
            title: "How High",
            year: 2001,
            songlist: ["Part II", "Round and Round (Remix)", "Cisco Kid"],
            score: 4.5
          }, {
            title: "Blackout! 2",
            year: 2009,
            songlist: ["BO", "I'm Dope", "A-Yo"],
            score: 4.5
          }, {
            title: "Wu-Massacre",
            year: 2010,
            songlist: ["Criminology 2.5", "Meth vs. Chef 2", "Smooth Sailing"],
            score: 4
          }]
          puts "Would you like to see more about one of these albums?."
          puts "What would you like to do?"
          puts "Options: 1. #{collab_work[0][:title]}, 2. #{collab_work[1][:title]}, 3. #{collab_work[2][:title]}, 4. #{collab_work[3][:title]}, 5. Back, 6. Exit"
          puts "Press either 1/2/3/4/5/6"
          input = gets.chomp
          system "clear"
          if input != "5" && input != "6"
            album = (collab_work[(input.to_i - 1)])
            album_outputs(album)
          elsif input == "5"
            albums_menu = false
          elsif input == "6"
            discography_menu = false
            albums_menu = false
            quit = true
          end
        end
      elsif input == "3"
        discography_menu = false
      elsif input == "4"
        quit = true
      end
    end
  elsif input == "2"
    acting_menu = true
    while acting_menu == true
      system "clear"
      puts "#{NAME} has been in movies and television ."
      puts "What would you like to do?"
      puts "Options: 1. Movies, 2. Television, 3. Back, 4. Exit"
      puts "Press either 1/2/3/4"
      input = gets.chomp
      system "clear"
      if input == "1"
        # I did the hard work of putting it into a hash for you. You're welcome.
        film_list = [{
          title: "The Film",
          role: 1995,
          year: "Himself"
        }, {
          title: "The Great White Hype",
          role: "Himself",
          year: 1996
        }, {
          title: "Cop Land",
          role: "Shondel",
          year: 1997
        }, {
          title: "One Eight Seven",
          role: "Dennis Broadway",
          year: 1997
        }]
        film_menu = true
        while film_menu == true
          puts "Would you like to see more about one of these movies?."
          puts "What would you like to do?"
          puts "Options: 1. #{film_list[0][:title]}, 2. #{film_list[1][:title]}, 3. #{film_list[2][:title]}, 4. #{film_list[3][:title]}, 5. Back, 6. Exit"
          puts "Press either 1/2/3/4/5/6"
          input = gets.chomp
          system "clear"
          if input != "5" && input != "6"
            film = (film_list[(input.to_i - 1)])
            film_output(film, 'movie')
          elsif input == "5"
            albums_menu = false
          elsif input == "6"
            discography_menu = false
            albums_menu = false
            quit = true
          end
        end
      elsif input == "2"
        television_list = [{
          title: "Space Ghost Coast to Coast",
          episode: "Surprise",
          role: "Himself",
          year: 1996
        }, {
          title: "Martin",
          episode: "You Play Too Much",
          role: "Robber: M-E-T-H-O-D Man",
          year: 1997
        }, {
          title: "Station Zero",
          episode: "Uptown, Baby",
          role: "Himself",
          year: 1999
        }, {
          title: "Oz",
          episode: "Multiple",
          role: "Tug Daniels",
          year: 2001
        }]
        television_menu = true
        while television_menu == true
          puts "Would you like to see more about one of these shows?."
          puts "What would you like to do?"
          puts "Options: 1. #{television_list[0][:title]}, 2. #{television_list[1][:title]}, 3. #{television_list[2][:title]}, 4. #{television_list[3][:title]}, 5. Back, 6. Exit"
          puts "Press either 1/2/3/4/5/6"
          input = gets.chomp
          system "clear"
          if input != "5" && input != "6"
           film = (television_list[(input.to_i - 1)])
           film_output(film, 'tv')
          elsif input == "5"
           albums_menu = false
          elsif input == "6"
           discography_menu = false
           albums_menu = false
           quit = true
          end
        end
      elsif input == "3"
        acting_menu = false
      elsif input == "4"
        acting_menu = false
        quit = true
      end
    end
  elsif input == "3"
    system "clear"
    puts "Clifford Smith Jr. (born March 2, 1971),[2] better known by his stage name #{NAME}, is an American rapper, songwriter, record producer and actor. He is known as a member of the East Coast hip hop collective Wu-Tang Clan. He is also one half of the hip hop duo #{NAME} & Redman. He took his stage name from the 1979 film #{NAME}.[3] In 1996, Smith won a Grammy Award for Best Rap Performance by a Duo or Group, for 'I\'ll Be There for You/You're All I Need to Get By', featuring American R&B singer Mary J. Blige who he currently stars with in Power Book II: Ghost, a spin-off of its original show Power."
    puts "Smith has appeared in films such as 187 (1997), Belly (1998), How High (2001), Garden State (2004), The Wackness (2008), Venom (2005), Red Tails (2012), Keanu (2016), and The Cobbler (2014). On television, he and frequent collaborator, fellow East Coast rapper Redman, co-starred on the short-lived Fox sitcom Method & Red. He has also had recurring roles in three HBO series, as Tug Daniels in Oz, Melvin 'Cheese' Wagstaff in The Wire, and Rodney in The Deuce.[4] #{NAME} also appears in the TBS comedy The Last O.G.. "
  elsif input == "4"
    quit = true
  end
end

puts "Thank you for visiting."
puts "Have a good day."
