class Search

    attr_accessor :input
    def initialize(input:)
        @input = input
    end

    def search_by_size(size)
        dogs = Dog.all
        dogs.select {|dog| dog.size == size}
    end

end 