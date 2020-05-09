
class Api

        def self.get_by_name
            url = URI("https://www.shelterluv.com/api/v1/animals")
        
            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true
        
            request = Net::HTTP::Get.new(url)
            request["x-api-key"] = ENV["KEY"]
        
            response = https.request(request)
            animals = JSON.parse(response.body)
            dogs = animals['animals']
            dogs.collect do |animal|
                name = animal["Name"]
                internal_id = animal["Internal-ID"]
                sex = animal["Sex"]
                status = animal["Status"]
                in_foster = animal["InFoster"].to_s
                size = animal["Size"]
                photos = animal["Photos"]
                breed = animal["Breed"]
                color = animal["Color"]
                age = animal["Age"]
                adoption_fee = animal["AdoptionFeeGroup"]
                Dog.new(name: name, internal_id: internal_id, sex: sex, status: status, in_foster: in_foster, size: size, photos: photos, breed: breed, color: color, age: age, adoption_fee: adoption_fee)
            end 
        
        end 

        def self.get_people
            url = URI("https://www.shelterluv.com/api/v1/people")
        
            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true
        
            request = Net::HTTP::Get.new(url)
            request["x-api-key"] = ENV["KEY"]
        
            response = https.request(request)
            people = JSON.parse(response.body)
            


        end 

end
    