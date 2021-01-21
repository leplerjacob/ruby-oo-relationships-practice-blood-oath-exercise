class Cult
    # Remove :followers
    attr_accessor :name, :city, :year_founded, :slogan
    @@all_cults = []

    def self.create_cult(name, city, slogan, year_founded)
        @@all_cults << cult = self.new
        cult.name = name
        cult.city = city
        cult.slogan = slogan
        cult.year_founded = year_founded
        cult
    end

    def self.all
        @@all_cults
    end

    def self.find_by_name(name)
        @@all_cults.select{|cult| cult.name == name }
    end

    def self.find_by_location(city)
        @@all_cults.select{|cult| cult.city == city }
    end

    def self.find_by_founding_year(year)
        @@all_cults.select{|cult| cult.year_founded.split("-")[0].to_i == year}
    end

    def recruit_follower(follower)
        BloodOath.initiate_oath(follower,self,Time.now.to_s.split(" ")[0])
    end

    def cult_population
        BloodOath.all_followers_of(self)
    end

    def average_age
        res = BloodOath.all_followers_of(self)
        avg = res.sum{|oath| oath.follower.age } / res.count
    end

    def my_followers_mottos
        BloodOath.all_followers_of(self).collect{|oath| oath.follower.name + ": " + oath.follower.life_motto }
    end

    def self.least_popular
        @@all_cults[@@all_cults.map.with_index{|cult, index|
            cult.cult_population.count
        }.min]
    end
    
    def self.most_common_location
        @@all_cults.collect{|cult|cult.city}.max_by{|city| @@all_cults.count{|cult|cult.city == city}}
    end

    
end