module Anyplayer
  class Player
    DEFAULT_VOTES_TO_SKIP = 5

    def initialize
      @votes = 0
    end

    # Guess the player name
    def name
      self.class.to_s.gsub(/^.*::/, '')
    end

    # Method for voting to skip song
    def vote(votes_to_skip = DEFAULT_VOTES_TO_SKIP)
      @votes += 1
      if @votes >= votes_to_skip
        self.next
        @votes = 0
      end
    end

    # Method to get current votes
    def votes
      @votes
    end

    # root next and prev methods reset votes
    def next
      reset_votes
    end

    def prev
      reset_votes
    end

    # Methods to override
    def launched?; false; end
    def playpause; end
    def voldown; end
    def volup; end
    def volume; end
    def track; end
    def artist; end
    def album; end

    private
      def reset_votes
        @votes = 0
      end

  end
end

