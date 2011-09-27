# Default Player class that is inherrited by all players.
#
# All players should override these methods:
#   launched? (return bool)
#   next
#   prev
#   play
#   pause
#   playpause
#   track     (return string)
#   artist    (return string)
#   album     (return string)
#   voldown
#   volup
#   volume    (return int)
#   playing?  (return bool)
#   paused?   (return bool)
module Anyplayer
  class Player
    DEFAULT_VOTES_TO_SKIP = 5

    def initialize
      @votes = 0
    end

    def launched?
      false
    end

    # Player name is the classe's, feel free to override it
    def name
      self.class.to_s.gsub(/^.*::/, '')
    end

    def playpause
      paused? ? play : pause
    end

    # Vote to skip song
    def vote(votes_to_skip = DEFAULT_VOTES_TO_SKIP)
      @votes += 1
      if @votes >= votes_to_skip
        self.next
        reset_votes
      end
    end

    def votes
      @votes
    end

    # Root next and prev reset the votes, so be sure to call super
    # in children
    def next
      reset_votes
    end

    def prev
      reset_votes
    end

    private
      def reset_votes
        @votes = 0
      end

  end
end

