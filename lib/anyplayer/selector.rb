# The Selector is the tool that will find you the currently running player on your platform
#
# Example:
#
#   selector = Anyplayer::Selector.new
#   selector.verbose = true
#   player = selector.player
#
# Needs the PLAYERS constant to contain a list of players.

class Anyplayer::Selector
  attr_accessor :verbose
  attr_reader :errors

  def initialize
    @verbose = false
    @errors = []
  end

  # Returns an instance of the first music player that's launched
  def player
    players_for_this_platform.each { |player|
      player_load(player) or next
      instance = player_class(player).new
      return instance if player_launched(instance)
    }
    nil
  end


  private

    def players_for_this_platform
      players = Anyplayer::PLAYERS
      players.reject! { |player| player =~ /_mac$/ } if RUBY_PLATFORM !~ /darwin/
      players.reject! { |player| player =~ /_windows$/ } if RUBY_PLATFORM !~ /cygwin|mswin|mingw|bccwin|wince|emx/
      players
    end

    def player_load(player)
      begin
        require "anyplayer/players/#{player}"
        $stderr.puts "Loaded #{player}" if verbose
        true
      rescue LoadError => e
        $stderr.puts "Could not load #{player}" if verbose
        @errors << "Error loading #{player}: #{e.message}"
        false
      end
    end

    def player_class(player)
      camelized = player.to_s.split(/_/).map{ |word| word.capitalize }.join
      Anyplayer::const_get(camelized)
    end

    def player_launched(player)
      $stderr.puts "#{player.name} launched?" if verbose

      seconds = 5
      begin
        Timeout::timeout(seconds) { player.launched? }
      rescue Timeout::Error
        $stderr.puts "Timed out after #{seconds} seconds" if verbose
        false
      end
    end
end
