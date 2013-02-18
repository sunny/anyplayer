class Anyplayer::Rhythmbox < Anyplayer::Player
  def playpause
    rhythmbox 'play-pause'
  end

  def play
    rhythmbox 'play'
  end

  def pause
    rhythmbox 'pause'
  end

  def prev
    rhythmbox 'previous'
    super
  end

  def next
    rhythmbox 'next'
    super
  end

  def voldown
    rhythmbox 'volume-down'
  end

  def volup
    rhythmbox 'volume-up'
  end

  def volume
    rhythmbox 'print-volume'
  end

  def track
    rhythmbox 'print-playing-format=%tt'
  end

  def artist
    rhythmbox 'print-playing-format=%ta'
  end

  def album
    rhythmbox 'print-playing-format=%at'
  end

  def launched?
    %x(rhythmbox-client --no-start --print-playing 2>/dev/null).rstrip != ""
  end

  private
    def rhythmbox(command)
      %x(rhythmbox-client --no-start --#{command}).rstrip
    end
end

