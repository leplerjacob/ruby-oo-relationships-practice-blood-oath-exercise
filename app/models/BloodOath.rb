class BloodOath
    attr_accessor :follower, :cult, :initiation_date

    @@all_oaths = []

    # testing purpose
    @@attempted_second_oath = []
    
    def self.initiate_oath(follower, cult, initiation_date)
        if !self.check_existing_oath(follower, cult)
            @@all_oaths << oath = self.new
            oath.follower = follower
            oath.cult = cult
            oath.initiation_date = initiation_date
            cult.recruit_follower(follower)
            follower.join_cult(cult)
            oath
        else
            @@attempted_second_oath << "#{follower.name} attempted to join '#{cult.name}' cult"
            nil
        end
    end

    # testing purpose. If follower already belongs to cult, follower/cult passed into separate array
    def self.all_attempts
        @@attempted_second_oath
    end

    def self.all
        @@all_oaths
    end

    def self.check_existing_oath(follower, cult)
        @@all_oaths.one?{|oath| oath.follower == follower && oath.cult == cult }
    end
    
    def self.all_followers_of(cult)
        @@all_oaths.select{|oath| oath.cult == cult}
    end
    
    def self.find_cult_by_follower(follower)
        @@all_oaths.select{|oath| oath.follower == follower}
    end

    def initiation_date
        @initiation_date
    end

end