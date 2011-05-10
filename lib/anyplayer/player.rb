module Anyplayer
  class Player
    @votes = 0

    # Guess the player name
    def name
      self.class.to_s.gsub(/^.*::/, '')
    end

    # Method for voting to skip song
    def vote(VOTES_TO_SKIP = 5)
      @votes += 1
      if @votes >= VOTES_TO_SKIP
        self.next
        @votes = 0
      end
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

