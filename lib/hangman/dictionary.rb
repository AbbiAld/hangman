module Hangman
  module Dictionary
    WORDS = File.readlines("food_words", chomp: true)
    LONG_WORDS = []
    WORDS.each do |word|
    	if word.length >= 6
    		LONG_WORDS.push(word)
    	end
    end

    def self.random
      LONG_WORDS.sample.strip
    end
  end
end
