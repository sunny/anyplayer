
require "anyplayer"

module Anyplayer::CommandLine
  extend self

  ACTIONS = %w(playpause play pause next prev voldown volup vote)
  INFOS = %w(volume track artist album name)
  BOOLEANS = %w(launched playing paused)

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
    command(player, argv.first)
  end


  private

  def command(player, command)
    if ACTIONS.include?(command)
      player.send(command)
    elsif INFOS.include?(command)
      puts player.send(command)
    elsif BOOLEANS .include?(command)
      exit(player.send("#{command}?") ? 0 : 1)
    else
      puts <<USAGE
Usage: anyplayer [-v] [command]

Where command is one of: playpause, play, pause, next, prev, voldown, volup,
volume, track, artist, album, vote, name, launched.

Player connected: #{player.name}.
USAGE
      exit(1)
    end
  end

end
