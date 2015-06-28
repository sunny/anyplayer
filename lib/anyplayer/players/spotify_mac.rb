class Anyplayer::SpotifyMac < Anyplayer::Player
  def play
    spotify 'play'
  end

  def pause
    spotify 'pause'
  end

  def playpause
    spotify 'playpause'
  end

  def prev
    spotify 'previous track'
    super
  end

  def next
    spotify 'next track'
    super
  end

  def voldown
    spotify 'set sound volume to sound volume - 10'
  end

  def volup
    spotify 'set sound volume to sound volume + 10'
  end

  def volume
    spotify 'return sound volume'
  end

  def track
    spotify 'return name of current track'
  end

  def artist
    spotify 'return artist of current track'
  end

  def album
    spotify 'return album of current track'
  end

  def playing?
    playing = spotify 'return player state is playing'
    playing == "true"
  end

  def launched?
    %x(osascript -e 'app "Spotify" is running').rstrip == "true"
  end

  def name
    "Spotify Mac"
  end

  def platforms
    [:mac]
  end


  private

  def spotify(command)
    %x(osascript -e 'tell app "Spotify" to #{command}').rstrip
  end
end
