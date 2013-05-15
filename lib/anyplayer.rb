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
    Selector.new.player
  end
end

require "anyplayer/player"
require "anyplayer/selector"


