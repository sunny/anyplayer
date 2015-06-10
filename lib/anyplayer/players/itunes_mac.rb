class Anyplayer::ItunesMac < Anyplayer::Player
  def play
    itunes 'play'
  end

  def pause
    itunes 'pause'
  end

  def playpause
    itunes 'playpause'
  end

  def prev
    itunes 'previous track'
    super
  end

  def next
    itunes 'next track'
    super
  end

  def voldown
    itunes 'set sound volume to sound volume - 10'
  end

  def volup
    itunes 'set sound volume to sound volume + 10'
  end

  def volume
    itunes 'return sound volume'
  end

  def track
    itunes 'return name of current track'
  end

  def artist
    itunes 'return artist of current track'
  end

  def album
    itunes 'return album of current track'
  end

  def playing?
    playing = itunes 'return player state is playing'
    playing == "true"
  end

  def launched?
    %x(osascript -e 'app "iTunes" is running').rstrip == "true"
  end

  def name
    "iTunes Mac"
  end

  def platforms
    [:mac]
  end


  private

  def itunes(command)
    %x(osascript -e 'tell app "iTunes" to #{command}').rstrip
  end
end
