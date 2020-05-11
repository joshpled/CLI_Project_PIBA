class Cli

    def run
        a = Artii::Base.new
        b = Artii::Base.new :font => 'straight'
        Api.get_by_name
        Api.get_people
        Dog.dog_person

        puts "\n" + a.asciify('PIBA').colorize(:light_yellow)
        puts "\n" + "#{b.asciify('powered by')} Shelter Luv".colorize(:yellow)

        prompt_user
        print "Option: " 
        input = gets.strip.downcase
        
        while input != "exit"
            if input.to_i == 1 or input == 'list'
                puts "\n" + b.asciify('LIST').colorize(:yellow)
                print_dogs_by_name(Dog.all)
                print "\nOption: " 
                input = gets.strip.downcase
                chosen_dog(input)
            elsif input.to_i == 2 or input == 'search'
                puts "\n" + b.asciify('SEARCH').colorize(:yellow)
                puts "\nYou can search based on the following criteria:"
                puts "\n1. Size"
                puts "2. Sex"
                puts "3. Availability"
                print "\nOption: " 
                input = gets.strip.downcase
                case input.to_i
                when 1
                    dogs_by_size
                    print "\nOption: "
                    input = gets.strip.downcase
                    chosen_dog(input)
                when 2
                    dogs_by_sex
                    print "\nOption: "
                    input = gets.strip.downcase
                    chosen_dog(input)
                when 3
                    Search.search_by_availability
                else 
                 prompt_user
                end 
            elsif input.to_i == 3 or input == 'fosters'
                puts "\n" + b.asciify('FOSTERS').colorize(:yellow)
                Person.all.each.with_index(1) do |person, index|
                    puts "#{index}. #{person.first_name} #{person.last_name}"
                    end 
                puts "\n\nSome fosters are also staff."
                print "\nOption: " 
                input = gets.strip.downcase
                chosen_foster(input)
            elsif input == "home"
                prompt_user
            else
                puts "\nInvalid input"
                puts "\nIf choosing from a numbered list, your input must be a number."
                puts 
            end 
             print "\nOption: "
             input = gets.strip.downcase
        end 

        puts "\n" + b.asciify('PIBA Foundation').colorize(:yellow)
        puts "\nThe PIBA Foundation is committed to assisting and advocating for the well-being of individuals and animals through disaster relief, community engagement, and environmental quality."
        puts "\nThe PIBA Foundation is a 501(c)(3) organization. Contributions to The PIBA Foundation are tax-deductible to the extent allowed by law. The tax identification number is 84-2979389."
        puts "\nThank You for checking in!"
        puts

    end 

    def prompt_user
        puts "\n\nChoose from the following options:"
        puts "\n1. List of Dogs"
        puts "2. Search Dogs"
        puts "3. Fosters"
        puts
    end
    
    def print_dogs_by_name(list)
        puts "\nThese are the dogs currently in the PIBA Foundation Database:"
        puts 
        list.each.with_index(1) do |dog, index|
        puts "#{index}. #{dog.name}"
        end 
        puts "\nWhich dog would you like more information on?"
    end 

    def dog_details(dog_id)

        dog = Dog.all.detect {|dog| dog.internal_id == dog_id.to_s}
        puts "\nSay Hello To: #{dog.name.colorize(:light_yellow)}!"
        # puts "\nAge: #{dog.age > 1 ? dog.age / 12 : dog.age} years & #{dog.age % 12} months old." ## Remember to account for months and days.
        puts "Size: #{dog.size}"
        puts "Breed: #{dog.breed}"
        puts "Color: #{dog.color}"
        puts "Status: #{dog.status.include?("Available") ? "Available for Adoption" : "Not Available, Currently with Foster"}"
        puts "With A Foster? #{dog.in_foster ? "Yes" : "No"}"
        print dog.in_foster ? "Foster: #{dog.person["FirstName"]} #{dog.person["LastName"]}" : print
        puts "\nAdoption Fee: $#{dog.adoption_fee["Price"]}"
        puts "Photos: #{dog.photos.join}"
        puts 

    end 

    def chosen_dog(input)
        dog_id = Dog.all[input.to_i-1].internal_id]
        dog_details(dog_id)
        puts "\nTYPE: \n'list' for list of dogs, \n'fosters' for list of fosters, \n'search' for search menu, \n'home' for main menu,  or 'exit' to close program"
    end 

    def dogs_by_size
        puts "\n\nChoose from the following options:"
        puts "\n1. Small (1-19)"
        puts "\n2. Medium (20-59)"
        puts "\n3. Large (60-99)"
        puts "\n4. Extra-Large (100+)"
        puts "\nWhat size are you looking for?"
        print "\nOption: "
        input = gets.strip.downcase
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

    def dogs_by_sex
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

    def chosen_foster(input)
        person_id = Person.all[input.to_i-1].internal_id
        fosters_info(person_id)
        puts "\nTYPE: \n'list' for list of dogs, \n'fosters' for list of fosters, \n'search' for search menu, \n'home' for main menu,  or 'exit' to close program"
    end 

    def fosters_info(person_id)
        person = Person.all.detect {|person| person.internal_id == person_id.to_s}
        puts "\n#{person.first_name} #{person.last_name}"
        puts "#{person.email}"
        puts
    end 
    
end 
