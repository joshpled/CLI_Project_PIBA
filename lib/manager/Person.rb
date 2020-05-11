class Person

    attr_accessor :first_name, :last_name, :email, :dog, :internal_id

    def initialize(first_name:, last_name:, email: "N/A", dog: "N/A", internal_id: "N/A")
        @first_name = first_name
        @last_name = last_name
        @email = email
        @dog = dog
        @internal_id = internal_id
    end 

    

    
end 