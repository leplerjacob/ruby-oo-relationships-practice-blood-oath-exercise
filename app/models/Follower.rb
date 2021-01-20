class Follower
    attr_accessor :name, :age, :life_motto, :cults_joined

    @@all_followers = []
    def self.create_follower(name, age, life_motto)
        @@all_followers << follower = self.new
        follower.cults_joined = []
        follower.name = name
        follower.age = age
        follower.life_motto = life_motto
        follower
    end

    def self.all
        @@all_followers
    end

    def join_cult(cult)
        oath = BloodOath.initiate_oath(self, cult, Time.now.to_s.split(" ")[0])
        if !oath
            @cults_joined << cult
        end
        oath
    end

    def cults
        
    end

end