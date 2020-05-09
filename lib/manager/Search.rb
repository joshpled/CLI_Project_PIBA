class Search

    attr_accessor :input
    def initialize(input:)
        @input = input
    end

    def self.search_by_size(size)

        dogs = Dog.all
        dogs.select {|dog| dog.size.include? size}


    end

end 