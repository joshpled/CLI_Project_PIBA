class Dog

    attr_accessor :name, :internal_id, :sex, :status, :in_foster, :size, :photos, :breed, :color, :age

    @@all = []

    def initialize(name:, internal_id:, sex: "N/A", status: "N/A", in_foster: "N/A", size: "N/A", photos: "N/A", breed: "N/A", color: "N/A", age: "N/A")
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
        @@all << self
    end 

    def self.all
        @@all.sort_by{ |word| word.internal_id }
    end

    def self.find_by_id(internal_id)
        self.all.select{|dog| dog.internal_id == internal_id}
    end 

end 
