class Anyplayer::Xmms2 < Anyplayer::Player
  def playpause
    xmms2 'toggle'
  end

  def play
    xmms2 'play'
  end

  def pause
    xmms2 'pause'
  end

  def prev
    xmms2 'prev'
    super
  end

  def next
    xmms2 'next'
    super
  end

  def voldown
    current = volume.to_i
    new_volume = (current < 11 ? 0 : current - 10)
    xmms2 "server volume #{new_volume}"
  end

  def volup
    current = volume.to_i
    new_volume = (current > 89 ? 100 : current + 10)
    xmms2 "server volume #{new_volume}"
  end

  def volume
    # currently just the first (left?) channel
    xmms2('server volume').split("\n").first.sub(/([^0-9]*)/, '')
  end

  def track
    xmms2 "current -f '${title}'"
  end

  def artist
    xmms2 "current -f '${artist}'"
  end

  def album
    xmms2 "current -f '${album}'"
  end

  def playing?
    xmms2("current -f '${playback_status}'") == "Playing"
  end

  def paused?
    xmms2("current -f '${playback_status}'") == "Paused"
  end

  def launched?
    # xmms2 autolaunches the daemon, so this should always be true
    %x(xmms2 current 2> /dev/null)
    $? == 0
  end

  def host
    ENV['XMMS_PATH'] || super
  end

  private
    def xmms2(command)
      ret = %x(xmms2 #{command}).split("\n").first
      ret ? ret.strip : ""
    end
end

