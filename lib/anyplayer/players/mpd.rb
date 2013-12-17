begin
  require 'ruby-mpd'
rescue LoadError => e
  raise LoadError.new "#{e.message} — please install ruby-mpd gem"
end


class Anyplayer::Mpd < Anyplayer::Player
  def initialize
    @mpc = false
    super
  end

  def playpause
    mpc.paused? && 
      mpc.send_command(:play) ||
      mpc.send_command(:pause)
  end

  def play
    mpc.play
  end

  def pause
    # ruby-mpd tries to send an additional argument to the MPD server
    # which at least doesn't work with Mopidy.
    mpc.send_command :pause
  end

  def prev
    mpc.previous
    super
  end

  def next
    mpc.next
    super
  end

  def voldown
    mpc.volume -= 10
  end

  def volup
    mpc.volume += 10
  end

  def volume
    mpc.volume
  end

  def track
    mpc.current_song && mpc.current_song.title
  end

  def artist
    mpc.current_song && mpc.current_song.artist
  end

  def album
    mpc.current_song && mpc.current_song.album
  end

  def launched?
    !!(@mpc && @mpc.connected? || connect)
  end

  def host
    ENV['MPD_HOST'] || super
  end

  private
  def connect
    @mpc ||= MPD.new
    @mpc.connect
  rescue
    false
  end

  def mpc
    @mpc || connect
    @mpc
  end
end

