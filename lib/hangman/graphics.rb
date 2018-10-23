module Hangman
  module Graphics
    DEAD = <<HANG
    _______
   |/      |
   |      (_)
   |      \\|/
   |       |
   |      / \\
   |
  _|___
HANG


    DANCE_1 = <<DANCER

  (•_•)
  <)  )╯
  /   \\
DANCER

    DANCE_2 = <<DANCES

 \\(•_•)
  (  (>
  /   \\
DANCES

    DANCE_3 = <<DANCED

  (•_•)
  <)  )>
  /   \\
DANCED

    OBFUSCATION_CHAR = "👾"

    def self.dance_party
      5.times do
        Graphics.clear_screen
        puts Graphics::DANCE_1
        puts "\n\nWELL DONE!! YOU SURVIVED"
        sleep 0.3
        Graphics.clear_screen
        puts Graphics::DANCE_3
        puts "\n\nWELL DONE!! YOU SURVIVED"
        sleep 0.3
        Graphics.clear_screen
        puts Graphics::DANCE_2
        puts "\n\nWELL DONE!! YOU SURVIVED"
        sleep 0.3
        Graphics.clear_screen
        puts Graphics::DANCE_3
        puts "\n\nWELL DONE!! YOU SURVIVED"
        sleep 0.3
      end
      Graphics.clear_screen
      puts Graphics::DANCE_1
      puts "\n\nWELL DONE!! YOU SURVIVED"
    end

    def self.clear_screen
      # The ` ` allow you to run bash commands from inside your ruby code!
      # clear itself is just a bash command… go ahead and try running it in
      # your terminal!
      puts `clear`
    end

    def self.obfuscate_word word, guessed
      obfuscated = ''

      word.chars do |char|
        if guessed.include? char
          obfuscated << " #{char} "
        else
          obfuscated << " #{OBFUSCATION_CHAR}  "
        end
      end

      obfuscated
    end
  end
end
