class Follower
    attr_accessor :name, :age, :life_motto

    @@all_followers = []
    def self.create_follower(name, age, life_motto)
        @@all_followers << follower = self.new
        follower.name = name
        follower.age = age
        follower.life_motto = life_motto
        follower
    end

    def self.all
        @@all_followers
    end

    def self.of_a_certain_age(age)
        @@all_followers.select{|follower| follower.age == age}
    end

    def join_cult(cult)
        BloodOath.initiate_oath(self, cult, Time.now.to_s.split(" ")[0])
    end

    def cults
        BloodOath.find_cult_by_follower(self)
    end

    def my_cults_slogans
        self.cults.collect{|oath| oath.cult.slogan}
    end

    def self.most_active
       BloodOath.all.max_by{|oath|oath.follower.cults.count}.follower
    end

    def self.top_ten
        list = BloodOath.all.map.with_index{|oath|oath.follower.cults.count}
        binding.pry
        list.sort
    end

end