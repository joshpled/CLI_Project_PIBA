class Dog

    attr_accessor :name, :internal_id, :sex, :status, :in_foster, :size, :photos, :breed, :color, :age, :adoption_fee, :person

    @@all = []

    def initialize(name:, internal_id:, sex: "N/A", status: "N/A", in_foster: "N/A", size: "N/A", photos: "N/A", breed: "N/A", color: "N/A", age: "N/A", adoption_fee: "N/A", person: "N/A")
        @name = name
        @internal_id = internal_id
        @sex = sex
        @status = status
        @in_foster = in_foster
        @size = size
        @photos = photos
        @breed = breed
        @color = color
        @age = age
        @adoption_fee = adoption_fee
        @person = person
        @@all << self
    end 

    def self.all
        @@all.sort_by{ |word| word.internal_id }
    end

    def self.dog_person
        Person.all.each do |person|
            Dog.all.each do |dog|
                if person.first_name.to_s.include?(dog.person["FirstName"].to_s) && dog.person != nil
                    person.dogs = dog.name
                end 
            end 
        end
    end 

end 
