
class Cli

    def run
        a = Artii::Base.new
        b = Artii::Base.new :font => 'straight'
        Api.get_by_name
        Api.get_people
        
        puts "\n" + a.asciify('PIBA').colorize(:light_yellow)
        puts "\n" + "#{b.asciify('powered by')} Shelter Luv".colorize(:yellow)

        prompt_user
        print "Option: " 
        input = gets.strip.downcase
        
        while input != "exit"
            if input.to_i == 1 or input == 'list'
                print_dogs_by_name(Dog.all)
                input = gets.strip.downcase
                chosen_dog(input)
            elsif input == "home"
                prompt_user
            elsif input.to_i == 2 or input == 'search'
                size_search
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
    
    def print_dogs_by_name(list)
        puts "\nThese are the dogs currently in PIBA Foundation Database:"
        puts 
        list.each.with_index(1) do |dog, index|
        puts "#{index}. #{dog.name}"
        end 
        puts "\nWhich dog would you like more information on?"
        puts "\nType 'list' for list of dogs, 'home' for main menu, or 'exit' to close program"
        puts "\nOption: "
        puts
        
    end 

    def dog_details(dog_id)

        dog = Dog.all.detect {|dog| dog.internal_id == dog_id.to_s}

        puts "\nSay Hello To: #{dog.name.colorize(:blue)}!"
        puts "\nAge: #{dog.age / 12} years old" ## Remember to account for months and days.
        puts "Size: #{dog.size}"
        puts "Breed: #{dog.breed}"
        puts "Color: #{dog.color}"
        puts "Status: #{dog.status.include?("Available") ? "Available for Adoption" : "Not Available, Currently with Foster"}"
        puts "With A Foster? #{dog.in_foster ? "Yes" : "No"}"
        puts "Adoption Fee: $#{dog.adoption_fee["Price"]}"
        puts "Photos: #{dog.photos.join}"
        puts 

    end 

    def prompt_user 

        puts "\n\nChoose from the following options:"
        puts "\n1. List of Dogs"
        puts "2. Search Dogs"
        puts

    end

    def chosen_dog(input)

        dog_id = Dog.all[input.to_i-1].internal_id
        dog_details(dog_id)
        
    end 

    def size_search(input)
        
    end 


    

end 
