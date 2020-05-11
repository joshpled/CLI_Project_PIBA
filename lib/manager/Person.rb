class Person

    attr_accessor :first_name, :last_name, :email, :dogs, :internal_id

    @@all = []

    def initialize(first_name:, last_name:, email: "N/A", dogs: "N/A", internal_id: "N/A")
        @first_name = first_name
        @last_name = last_name
        @email = email
        @dogs = dogs
        @internal_id = internal_id
        @@all << self
    end 

    def self.all
        @@all.sort_by {|person| person.first_name}
    end 

end 