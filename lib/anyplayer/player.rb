module Anyplayer
  class Player

    # Guess the player name
    def name
      self.class.to_s.gsub(/^.*::/, '')
    end

    # Methods to override
    def launched?; false; end
    def playpause; end
    def next; end
    def prev; end
    def voldown; end
    def volup; end
    def volume; end
    def track; end
    def artist; end
    def album; end

  end
end

