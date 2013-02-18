module Anyplayer
  class Noplayer < Player
    def playpause
      super
    end

    def play
      super
    end

    def pause
      super
    end

    def prev
      super
    end

    def next
      super
    end

    def voldown
      super
    end

    def volup
      super
    end

    def volume
      100
    end

    def track
      "Money"
    end

    def artist
      "The Drums"
    end

    def album
      "Money"
    end

    def launched?
      true
    end
  end
end

