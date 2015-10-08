require "timeout"

module Anyplayer
  # Ordering of the players should put the most-used players and the fastest to
  # test at the top.
  #
  # iTunes Windows has been placed at the top because of some linux false
  # positives.
  # https://github.com/sunny/anyplayer/issues/8

  PLAYERS = %w(
    itunes_windows
    rhythmbox
    mpd
    xmms2
    amarok
    itunes_mac
    spotify_mac
    rdio_mac
  )

  def self.launched
    Selector.new.player
  end
end

require "anyplayer/player"
require "anyplayer/selector"
require "anyplayer/version"
