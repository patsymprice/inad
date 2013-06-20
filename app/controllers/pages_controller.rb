class PagesController < ApplicationController
  def index

  consumer_key = ENV["CONSUMER_KEY"]
  consumer_secret = ENV["CONSUMER_SECRET"]
  token = ENV["TOKEN"]
  token_secret = ENV["TOKEN_SECRET"]

# @test = [1, 4, 5]



   api_host = 'api.yelp.com'

   consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
   access_token = OAuth::AccessToken.new(consumer, token, token_secret)

def time_path
   t = Time.now.hour
   if 2 < t && t < 12
    path = "/v2/search?term=coffee&ll=37.788022,-122.399797&limit=10&sort=1"
   elsif 12 < t && t < 15
    path = "/v2/search?term=food&ll=37.788022,-122.399797&limit=10&sort=1"
   else
     path = "/v2/search?term=bars&ll=37.788022,-122.399797&limit=10&sort=1"
   end
  return path
end

 # path = "/v2/search?term=bars&ll=37.788022,-122.399797&limit=10&sort=1"

# time_path()
# binding.pry

   p = JSON(access_token.get(path).body)

   biz = []
   @names.v = []
   @display_address = []
   @distance = []
   @snippet_text = []


  @results = p["businesses"].each {|x| biz << x }
  @results.each  do |x|
    @names << x["name"]
    @display_address << x["location"]["display_address"]
    @distance << x["distance"]
    @snippet_text << x["snippet_text"]
  end





# "distance" from  lat long in meters
# "mobile_url" links back to yelp review for mobile_url
# "url" links back to yelp review on website
# "snippet_text" top review snippet_text
# "image_url" image of business
# "display_address"=>
#      ["46 Minna St",
#       "(b/t 2nd St & Shaw Aly)",
#       "Financial District",
#       "San Francisco, CA 94105"],
# "rating_img_url_small"  image of yelp ratings


  end
end
