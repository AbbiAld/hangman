module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess

    def initialize
      @chances = 8
      @wrong_tries = 0
      @guess = ""
      @word = Dictionary.random
    end

    def self.shut_down
      puts "\n Hasta la vista, baby!"
      sleep 1
    end

    Signal.trap("INT") {
      Game.shut_down
      exit
    }

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')

      while true
        print "[#{chances - wrong_tries} chances left]: "

        char = gets.chomp
        Graphics.clear_screen

        if (/[[:alpha:]]+/ =~ char) == nil
          puts "Oops! It looks like you didn't enter a letter. Please try again.\n" + Graphics.obfuscate_word(word, guess)
        elsif word.include? char
          if guess.include? char
            puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
          else
            guess << char
            placeholder = Graphics.obfuscate_word(word, guess)

            puts 'Whoop Whoop!! ' + placeholder
          end

          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            Graphics.dance_party
            break
          end
        else
          if guess.include? char
            puts "You already guessed that! The word STILL doesn't contain a '#{char}'...\n"
          else
            puts "OH NOES! The word doesn't contain '#{char}'"
            @wrong_tries = @wrong_tries + 1
            guess << char
          end
          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            break
          else
              puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
    end
  end
end
