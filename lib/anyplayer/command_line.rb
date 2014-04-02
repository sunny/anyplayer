
require "anyplayer"

module Anyplayer::CommandLine
  extend self

  COMMANDS = %w(
    playpause
    play
    pause
    next
    prev
    voldown
    volup
    volume
    track
    artist
    album
    vote
    name
    launched
    paused
    playing
  )

  def parse(argv)
    # Create a selector
    selector = Anyplayer::Selector.new
    if argv.first == "-v"
      selector.verbose = true
      argv.shift

      $stderr.puts "anyplayer v#{Anyplayer::VERSION}"
    end

    # Find the current player
    player = selector.player
    abort "Error: no player connected.\n" + selector.errors.join("\n") if !player

    # Call a command
    if argv.empty?
      usage(player)
    else
      command(player, argv.first)
    end
  end


  private

  # Call
  def command(player, command)
    response = call(player, command)

    case response
    when :undefined_command then usage(player)
    when true then exit(0)
    when false then exit(1)
    when String, Numeric then puts response
    end
  end

  # Call the method on the player
  # Tries the boolean method as well
  def call(player, command)
    [command, "#{command}?"].each do |method|
      method = method.to_sym
      return player.send(method) if player.respond_to?(method)
    end

    :undefined_command
  end

  def usage(player)
    $stderr.puts <<USAGE
Usage: anyplayer [-v] [command]

Where command is one of: #{COMMANDS.join(', ')}.

Player connected: #{player.name}.
USAGE
    exit(1)
  end
end
