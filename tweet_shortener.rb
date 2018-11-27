# Write your code here.
def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
}
end

def word_substituter(str)
   #turn str to array using split
   tweet = str.split(" ")
   #iterate through each element of the str
   new_tweet = tweet.collect do |word|
      #if the dictionary's keys are in the str index
      #return the value of the dictionary's keys instead of the original words
      if dictionary.keys.include?(word.downcase) #downcase: return copy of upcase to downcase 
         dictionary[word.downcase]
      else
         word #if not, just return the original words
      end
   end
   new_tweet.join(" ") #turn array to string using join
end

#Another solution:
def word_substituter(str)
   tweet = str.split(" ")
   tweet.each_with_index do |word, index|
      dictionary.each do |key, value|
         if word.downcase == key
            tweet[index] = value
         end
      end
   end
   tweet.join(" ")
end

# Method bulk_tweet_shortener takes in an array of tweets, 
# iterates over them, shortens them, 
# and puts out the results to the screen.

def bulk_tweet_shortener(tweet)
   tweet.each { |str| puts word_substituter(str) }
end

# Method selective_tweet_shortener only does the substitutions if the tweet is longer than 140 characters. 
# If the tweet is 140 characters or shorter, just return the original tweet.

def selective_tweet_shortener(tweet)
   if tweet.length > 140
      word_substituter(tweet)
   else
      tweet
   end
end

# Method shortened_tweet_truncator truncates the tweet to 140 characters with an ellipsis (...)
# if it's still too long after substitution.

def shortened_tweet_truncator(tweet)
   if tweet.length > 140
      word_substituter(tweet)
      tweet[0..136] + "..."
   else
      tweet
   end
end
