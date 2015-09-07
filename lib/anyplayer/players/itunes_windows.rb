begin
  require "win32ole"
rescue LoadError => e
  raise LoadError.new("#{e.message} - You probably aren't on Windows")
end

class Anyplayer::ItunesWindows < Anyplayer::Player
  def playpause
    itunes.PlayPause()
  end

  def play
    itunes.Play()
  end

  def pause
    itunes.Pause()
  end

  def prev
    itunes.PreviousTrack()
    super
  end

  def next
    itunes.NextTrack()
    super
  end

  def voldown
    itunes.SoundVolume = itunes.SoundVolume - 10
  end

  def volup
    itunes.SoundVolume = itunes.SoundVolume + 10
  end

  def volume
    itunes.SoundVolume
  end

  def track
    itunes.CurrentTrack.name
  end

  def artist
    itunes.CurrentTrack.Artist
  end

  def album
    itunes.CurrentTrack.Album
  end

  def launched?
    itunes
  end

  def name
    "iTunes Windows"
  end

  def platforms
    [:windows]
  end

  private

  def itunes
    itunes ||= WIN32OLE.new("iTunes.Application")
  end
end
