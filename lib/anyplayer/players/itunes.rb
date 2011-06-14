if RUBY_PLATFORM =~ /darwin/
  require 'appscript'
  include Appscript
end

module Anyplayer
  class Itunes < Player
    def playpause
      @app.playpause
    end

    def prev
      @app.previous_track
      super
    end

    def next
      @app.next_track
      super
    end

    def voldown
      @app.sound_volume.set(volume + 10)
    end

    def volup
      @app.sound_volume.set(volume + 10)
    end

    def volume
      @app.sound_volume.get
    end

    def track
      @app.current_track.name.get
    end

    def artist
      @app.current_track.artist.get
    end

    def album
      @app.current_track.album.get
    end

    def launched?
      return false unless RUBY_PLATFORM =~ /darwin/
      return false unless app('System Events').processes.name.get.include? "iTunes"
      @app = app('iTunes')
      true
    end

    def name
      "iTunes"
    end
  end
end

