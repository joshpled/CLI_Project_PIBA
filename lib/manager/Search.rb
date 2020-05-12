class Search

    attr_accessor :input,
    def initialize(input:)
        @input = input
    end



    def self.search_by_size(input)
        input = input
        dogs = Dog.all
        dogs.select {|dog| dog.size.include?(input) ? @@results << dog : nil}
        dogs.select {|dog| dog.size.include?(input)}.each.with_index(1) do |dog, index|
            puts "#{index}. #{dog.name}"
        end 
    end
    
    def self.search_by_sex(input)
        input = input
        dogs = Dog.all
        dogs.select {|dog| dog.sex.include?(input)}.each.with_index(1) do |dog, index|
            puts "#{index}. #{dog.name}"
        end 
    end 

    def self.search_by_availability
        dogs = Dog.all
        dogs.sort_by {|dog| dog.status}.each.with_index(1) do |dog, index|
            puts "#{index}. #{dog.name} is #{dog.status == "Available Foster" ? "Available!" : "Unavailable"}"
        end 
    end 

end 