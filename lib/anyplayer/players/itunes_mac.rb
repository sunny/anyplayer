begin
  require 'appscript'
rescue LoadError => e
  raise LoadError.new("#{e.message} -- Please try: gem install rb-appscript")
end

class Anyplayer::ItunesMac < Anyplayer::Player
  def playpause
    app.playpause
  end

  def play
    app.play
  end

  def pause
    app.pause
  end

  def prev
    app.previous_track
    super
  end

  def next
    app.next_track
    super
  end

  def voldown
    app.sound_volume.set(volume + 10)
  end

  def volup
    app.sound_volume.set(volume + 10)
  end

  def volume
    app.sound_volume.get
  end

  def track
    app.current_track.name.get
  end

  def artist
    app.current_track.artist.get
  end

  def album
    app.current_track.album.get
  end

  def launched?
    Appscript.app('System Events').processes.name.get.include?("iTunes") and app
  end

  def name
    "iTunes"
  end

  private

    def app
      @app ||= Appscript.app('iTunes')
    end
end
