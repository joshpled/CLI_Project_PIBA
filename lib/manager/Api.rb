
class Api

        def self.get_by_name
            url = URI("https://www.shelterluv.com/api/v1/animals")
        
            https = Net::HTTP.new(url.host, url.port);
            https.use_ssl = true
        
            request = Net::HTTP::Get.new(url)
            request["x-api-key"] = "1f99ddc5-2942-4b42-ae52-368fda549313"
        
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
                Dog.new(name: name, internal_id: internal_id, sex: sex, status: status, in_foster: in_foster, size: size, photos: photos, breed: breed, color: color, age: age)
            end 
        
        end 

        # def self.dog_details(internal_id)

        #     url = URI("https://www.shelterluv.com/api/v1/animals/#{internal_id}")

        #     https = Net::HTTP.new(url.host, url.port);
        #     https.use_ssl = true

        #     request = Net::HTTP::Get.new(url)
        #     request["x-api-key"] = "1f99ddc5-2942-4b42-ae52-368fda549313"

        #     response = https.request(request)
        #     dog = JSON.parse(response.body)
        #end 
    
end
    