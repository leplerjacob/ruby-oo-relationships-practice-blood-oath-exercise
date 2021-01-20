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

    # testing purpose
    def self.all_attempts
        @@attempted_second_oath
    end

    def self.all
        @@all_oaths
    end
  
    def self.check_existing_oath(follower, cult)
        @@all_oaths.one?{|oath| oath.follower == follower && oath.cult == cult }
    end

end