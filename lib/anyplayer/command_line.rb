
require "anyplayer"

module Anyplayer::CommandLine
  extend self

  def parse(argv)
    # Create a selector
    selector = Anyplayer::Selector.new
    if argv.first == "-v"
      selector.verbose = true
      argv.pop

      $stderr.puts "anyplayer v#{Anyplayer::VERSION}"
    end

    # Find the current player
    player = selector.player
    abort "Error: no player connected.\n" + selector.errors.join("\n") if !player

    # Call it
    case argv.first
      when "playpause" then player.playpause
      when "play"      then player.play
      when "pause"     then player.pause
      when "next"      then player.next
      when "prev"      then player.next
      when "voldown"   then player.voldown
      when "volup"     then player.volup
      when "volume"    then puts player.volume
      when "track"     then puts player.track
      when "artist"    then puts player.artist
      when "album"     then puts player.album
      when "vote"      then player.vote
      when "name"      then puts player.name
      when "launched"  then exit(player.launched? ? 0 : 1)
      when "playing"   then exit(player.playing? ? 0 : 1)
      when "paused"    then exit(player.playing? ? 0 : 1)
      else
        puts <<USAGE
    Usage: #{$0} [-v] [command]

    Where command is one of: playpause, play, pause, next, prev, voldown, volup,
    volume, track, artist, album, vote, name, launched.

    Player connected: #{player.name}.
USAGE

        exit(1)
    end

  end

end
