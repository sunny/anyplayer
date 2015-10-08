class Anyplayer::Amarok < Anyplayer::Player
  def playpause
    amarok "PlayPause"
  end

  def play
    amarok "Play"
  end

  def pause
    amarok "Pause"
  end

  def prev
    amarok "Prev"
    super
  end

  def next
    amarok "Next"
    super
  end

  def voldown
    amarok "VolumeDown 5"
  end

  def volup
    amarok "VolumeUp 5"
  end

  def volume
    amarok "VolumeGet"
  end

  def track
    amarok_get_meta "title"
  end

  def artist
    amarok_get_meta "artist"
  end

  def album
    amarok_get_meta "album"
  end

  def launched?
    not %x(qdbus org.kde.amarok 2>&1).match(
      /does not exist|not found|cannot find the path specified/
    )
  end

  def platforms
    [:unix, :linux]
  end

  private

  def amarok(command)
    %x(qdbus org.kde.amarok /Player org.freedesktop.MediaPlayer.#{command}).rstrip
  end

  def amarok_get_meta(name)
    amarok("GetMetadata").match(/#{name}: (\S.*)/)[1] rescue nil
  end
end
