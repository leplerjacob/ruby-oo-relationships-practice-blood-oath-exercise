class Cult
    attr_accessor :name, :city, :year_founded, :slogan, :followers
    @@all_cults = []

    def self.create_cult(name, city, slogan, year_founded)
        @@all_cults << cult = self.new
        cult.name = name
        cult.city = city
        cult.slogan = slogan
        cult.year_founded = year_founded
        cult.followers = []
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
        @followers.include?(follower) ? nil : @followers << follower
    end

    def cult_population
        self.followers.count
    end
end