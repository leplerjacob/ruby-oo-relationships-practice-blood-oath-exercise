require_relative '../config/environment.rb'
require "json"
json_followers = File.read("tools/followers_data.json")
followers_hash = JSON.parse(json_followers)

json_cults = File.read("tools/cult_data.json")
cults_hash = JSON.parse(json_cults)

def reload
  load 'config/environment.rb'
end

cults_hash.each{|cult|
  Cult.create_cult(cult["name"], cult["city"], cult["slogan"], cult["year_founded"])
}
followers_hash.each{|follower|
  Follower.create_follower(follower["name"], follower["age"], follower["life_motto"])
}

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f)).to_s.split(" ")[0]
end

# Adds follower to cult
Follower.all.each{|follower|
    year_joined =  time_rand Time.now.to_s.split("-")[0].to_i - (follower.age - 16)
    BloodOath.initiate_oath(follower, Cult.all.sample, year_joined)
}

for i in 0..rand(100) do
  Follower.all.sample.join_cult(Cult.all.sample)
end

# Samples
(fol_one, fol_two, fol_three, fol_four, fol_five) = Follower.all[0..4]
(cult_one, cult_two, cult_three, cult_four, cult_five) = Cult.all[0..4]

# followers without a cult
jacob = Follower.create_follower("Jacob", 29, "Never gunna give you up")
zed = Follower.create_follower("Zed", 30, "Live the Zed-lyfe")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits