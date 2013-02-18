require "timeout"

module Anyplayer
  PLAYERS = %w(
    rhythmbox
    mpd
    xmms2
    amarok
    itunes_mac
    itunes_windows
    spotify_mac
  )

  def self.launched
    $stderr.puts "Anyplayer.launched is deprecated: please initialize a new Selector and call player"
    Selector.new.player
  end
end

require "anyplayer/player"
require "anyplayer/selector"


