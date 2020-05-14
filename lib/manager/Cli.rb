class Cli

    def run
        ## Setting the fonts and running the API GET and assigning the respective classes with the proper attributes.
        a = Artii::Base.new
        b = Artii::Base.new :font => 'straight'
       
        Api.get_by_name
        Api.get_people

        
        ## Intro Logo
        puts "\n" + a.asciify('PIBA').colorize(:light_yellow)
        puts "\n" + "#{b.asciify('powered by')} Shelter Luv".colorize(:yellow)
        ## Intial prompt for user input.
        prompt_user
        print "Option: " 
        input = gets.strip.downcase
        # Dog.dog_person
        ## Loop for input.
        while input != "exit"
            if input.to_i == 1 or input == 'list'
                ## Display list of all current dogs in the PIBA Database.
                puts "\n" + b.asciify('LIST').colorize(:yellow)
                print_dogs_by_name(Dog.all)
                input = gets.strip.downcase.to_i
                if input > 0
                chosen_dog(input)
                end 
            elsif input.to_i == 2 or input == 'search'
                ## Search for a dog based on a criteria
                puts "\n" + b.asciify('SEARCH').colorize(:yellow)
                puts "\nYou can search based on the following criteria:"
                puts "\n1. Size"
                puts "2. Sex"
                puts "3. Availability"
                print "\nOption: " 
                input = gets.strip.downcase
                case input.to_i
                when 1
                    ## Uses a helper method below to display results.
                    dogs_by_size
                    print "\nOption: "
                    input = gets.strip.downcase.to_i
                    dog_id = Search.results[input.to_i-1].internal_id
                    dog_details(dog_id)
                when 2
                    ## Uses a helper method below to display results.
                    dogs_by_sex
                    print "\nOption: "
                    input = gets.strip.downcase.to_i
                    dog_id = Search.sex_results[input.to_i-1].internal_id
                    dog_details(dog_id)
                when 3
                    ## No helper method needed. 
                    Search.search_by_availability
                else
                 prompt_user
                end 
            elsif input.to_i == 3 or input == 'fosters'
                ## List of all fosters in the system. 
                puts "\n" + b.asciify('FOSTERS').colorize(:yellow)
                Person.all.each.with_index(1) do |person, index|
                    puts "#{index}. #{person.first_name} #{person.last_name}"
                    end 
                puts "\n\nSome fosters are also staff."
                print "\nOption: " 
                input = gets.strip.downcase.to_i
                input > 0 ? chosen_foster(input) : "Invalid Input"
            elsif input == "home"
                prompt_user
            else
                puts "\nInvalid input"
                puts "\nIf choosing from a numbered list, your input must be a number."
                puts 
            end
            puts "\nTYPE: \n'list' for list of dogs, \n'fosters' for list of fosters, \n'search' for search menu, \n'home' for main menu,  \nor 'exit' to close program"
            print "\nMenu Options: "
            input = gets.strip.downcase
        end 
        ## IF 'exit' is entered, the following will show and close the app. 
        puts "\n" + b.asciify('PIBA Foundation').colorize(:yellow)
        puts "\nThe PIBA Foundation is committed to assisting and advocating for the well-being of individuals and animals through disaster relief, community engagement, and environmental quality."
        puts "\nThe PIBA Foundation is a 501(c)(3) organization. Contributions to The PIBA Foundation are tax-deductible to the extent allowed by law. The tax identification number is 84-2979389."
        puts "\nThank You for checking in!"
        puts

    end 

    def prompt_user
        ## Prompts the user to choose from the three main categories.
        puts "\n\nChoose from the following options:"
        puts "\n1. List of Dogs"
        puts "2. Search Dogs"
        puts "3. Fosters"
        puts
    end

    ## List Helper Methods

    def print_dogs_by_name(list)
        ## For choice 1 or LIST -- List all names of the dogs found in the PIBA Foundation Database. 
        ## The list is sorted by internal_id variable of the dogs. 
        puts "\nThese are the dogs currently in the PIBA Foundation Database:"
        puts 
        list.each.with_index(1) do |dog, index|
        puts "#{index}. #{dog.name}"
        end 
        puts "\nWhich dog would you like more information on?"
        print "\nOption: " 

    end 

    def chosen_dog(input)
        ## Once the dog is chosen, the input is given as an integer.
        ## The input is actually choosing an index from the array. Then the internal_id of that dog in that index is pulled and passed through to dog_details. 
        dog_id = Dog.all[input.to_i-1].internal_id
        dog_details(dog_id)
    end 

    def dog_details(dog_id)
        ## When a dog is chosen, the details of that dog are displayed accordingly. 
        dog = Dog.all.detect {|dog| dog.internal_id == dog_id.to_s}
        
        puts "\nSay Hello To: #{dog.name.colorize(:light_yellow)}!"
        if dog.age == 12
            puts "\nAge: #{dog.ag / 12} year old"
        elsif dog.age < 12
            puts "\nAge: #{dog.age % 12} months old"
        elsif dog.age > 12 && dog.age < 14
            puts "\nAge: #{dog.age / 12} year & #{dog.age % 12} months old"
        else 
            puts "\nAge: #{dog.age / 12} years & #{dog.age % 12} months old"
        end 
        puts "Size: #{dog.size}"
        puts "Breed: #{dog.breed}"
        puts "Color: #{dog.color}"
        puts "Status: #{dog.status.include?("Available") ? "Available for Adoption" : "Not Available, Currently with Foster"}"
        puts "With A Foster? #{dog.in_foster ? "Yes" : "No"}"
        if dog.in_foster && dog.person
            puts "Foster: #{dog.person["FirstName"]} #{dog.person["LastName"]}"
        else
            puts "No information for Foster"
        end 
        if dog.adoption_fee
            puts "Adoption Fee: $#{dog.adoption_fee["Price"]}"
        else
            puts "Adoption Fee: N/A"
        end 
        puts "Photos: #{dog.photos.join}"
        puts 

    end 

    ## Search Helper Methods

    def dogs_by_size
        ## Using the Search Class, the following code will determine what size the use is looking for. 
        puts "\n\nChoose from the following options:"
        puts "\n1. Small (1-19)"
        puts "\n2. Medium (20-59)"
        puts "\n3. Large (60-99)"
        puts "\n4. Extra-Large (100+)"
        puts "\nWhat size are you looking for?"
        print "\nOption: "
        input = gets.strip.downcase.to_i
        case input.to_i
        when 1
            Search.search_by_size("Small")
        when 2
            Search.search_by_size("Medium")
        when 3
            Search.search_by_size("Large")
        when 4
            Search.search_by_size("Extra-Large")
        else 
            "Invalid"
        end
    end 

    ## CREATE AN ARRAY WITH THE RESULTS TO THEN CHOOSE CORRECT DOG FROM THAT ARRAY. 

    def dogs_by_size_results
        dogs_by_size_results = []
    end 

    def dogs_by_sex
        ## Self-Explanitory
        puts "\n\nChoose from the following options:"
        puts "\n1. Male"
        puts "\n2. Female"
        print "\nOption: "
        input = gets.strip.downcase
        case input.to_i
        when 1
            Search.search_by_sex("Male")
        when 2
            Search.search_by_sex("Female")
        else 
            "Invalid"
        end
    end 

    ## Fosters Helper Methods

    def chosen_foster(input)
        person_id = Person.all[input.to_i-1].internal_id
        fosters_info(person_id)
    end 

    def fosters_info(person_id)
        person = Person.all.detect {|person| person.internal_id == person_id.to_s}
        puts "\n#{person.first_name} #{person.last_name}"
        if person.email
            puts "#{person.email}"
        else 
            puts "NO INFORMATION AVAILABLE"
        end 
        puts
    end 
    
end 
