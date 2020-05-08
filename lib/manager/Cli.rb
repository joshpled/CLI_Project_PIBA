class Cli

    def run
        
        puts " "
        a = Artii::Base.new
        b = Artii::Base.new :font => 'straight'
        puts a.asciify('PIBA')
        puts "#{b.asciify('powered by')} Shelter Luv"
        Api.get_by_name
        puts " "
        puts " "

        prompt_user
        print "Option: " 
        input = gets.strip.downcase
        
        while input != "exit" or "exit!"
            if input.to_i == 1 or 'list'
                print_dogs_by_name(Dog.all)
                puts "Which dog would you like more information on?"
                input = gets.strip.downcase
                dog_id = Dog.all[input.to_i-1].internal_id
                dog_details(dog_id)
                puts "Type 'list' for list of dogs, or 'home' for main menu."
            else
                puts " "
                puts "Invalid input"
                puts " "
            end 
            input = gets.strip.downcase
        
        end 
        puts " "
        puts " "
        puts b.asciify('PIBA Foundation')
        puts "The PIBA Foundation is committed to assisting and advocating for the well-being of individuals and animals through disaster relief, community engagement, and environmental quality."
        puts "The PIBA Foundation is a 501(c)(3) organization. Contributions to The PIBA Foundation are tax-deductible to the extent allowed by law. The tax identification number is 84-2979389."
        puts "Thank You for checking in!"
    end 
    
    def print_dogs_by_name(list)
        puts " "
        puts "These are the dogs currently in PIBA Foundation Database:"
        puts " "
        list.each.with_index(1) do |dog, index|
        puts "#{index}. #{dog.name}"
        end 
        puts " "
    end 

    def dog_details(dog_id)

        dog = Dog.all.select {|dog| dog.internal_id == dog_id.to_s}
      
        puts " "
        puts "Say Hello To: #{dog[0].name}!"
        puts " "
        puts "Age: #{dog[0].age / 12} years old" ## Remember to account for months and days.
        puts "Size: #{dog[0].size}"
        puts "Status: #{dog[0].status.include?("Available") ? "Available for Adoption" : "Not Available, Currently with Foster"}"
        puts "With A Foster? #{dog[0].in_foster ? "Yes" : "No"}"
        puts " "
    end 

    def prompt_user 
        puts "Choose from the following options:"
        puts " "
        puts "1. List of Dogs"
        puts " "
    end

    

end 
