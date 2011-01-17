require "timeout"
require "anyplayer/player"

module Anyplayer
  PLAYERS = :itunes, :rhythmbox, :ituneswindows, :mpd, :xmms2, :amarok

  LOADED_PLAYERS = {}

  for player in PLAYERS
    require "anyplayer/players/#{player}"
    LOADED_PLAYERS[player] = const_get(player.to_s.capitalize).new
  end

  # Return the first music player that's launched
  def self::launched
    LOADED_PLAYERS.find { |key, player|
      puts "Trying #{player.name}..."
      begin
        Timeout::timeout(5) { player.launched? }
      rescue Timeout::Error
        puts "Timed out"
        nil
      end
    }[1]
  end
end
