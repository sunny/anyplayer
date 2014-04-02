class Anyplayer::RdioMac < Anyplayer::Player
  def play
    rdio 'play'
  end

  def pause
    rdio 'pause'
  end

  def playpause
    rdio 'playpause'
  end

  def prev
    rdio 'previous track'
    super
  end

  def next
    rdio 'next track'
    super
  end

  def voldown
    rdio 'set sound volume to sound volume - 10'
  end

  def volup
    rdio 'set sound volume to sound volume + 10'
  end

  def volume
    rdio 'return sound volume'
  end

  def track
    rdio 'return name of current track'
  end

  def artist
    rdio 'return artist of current track'
  end

  def album
    rdio 'return album of current track'
  end

  def playing?
    playing = rdio 'return player state is playing'
    playing == "true"
  end

  def launched?
    nb = %x(osascript -e 'tell app "System Events" to count (every process whose name is "rdio")' 2>/dev/null).rstrip
    nb.match(/^\d+/) and nb.to_i > 0 ? true : false
  end

  def name
    "Rdio Mac"
  end


  private

  def rdio(command)
    %x(osascript -e 'tell app "rdio" to #{command}').rstrip
  end
end
