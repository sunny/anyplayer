require "timeout"
require "anyplayer/player"

module Anyplayer
  PLAYERS = :itunes, :rhythmbox, :ituneswindows, :mpd, :xmms2, :amarok
  for player in PLAYERS
    require "anyplayer/players/#{player}"
  end

  # Return the first music player that's launched
  def self::launched(verbose = false)
    PLAYERS.each { |player|
      player = const_get(player.to_s.capitalize).new
      puts "Trying #{player.name}..." if verbose

      begin
        Timeout::timeout(5) { return player if player.launched? }
      rescue Timeout::Error
        puts "Timed out" if verbose
      end
    }
    nil
  end
end
