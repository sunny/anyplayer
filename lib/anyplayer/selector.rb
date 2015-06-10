require "rbconfig"

# The Selector is the tool that will find you the currently running player on your platform
#
# Example:
#
#   selector = Anyplayer::Selector.new
#   selector.verbose = true
#   player = selector.player
#
# Needs the PLAYERS constant to contain a list of players.
module Anyplayer
  class Selector
    attr_accessor :verbose
    attr_reader :errors

    def initialize
      @verbose = false
      @errors = []
    end

    # Returns an instance of the first music player that's launched
    def player
      PLAYERS.each do |player|
        player_load(player) or next

        instance = player_class(player).new
        instance.platforms.include?(platform) or next
        return instance if player_launched(instance)
      end
      nil
    end


    private

    def platform
      @platform ||= begin
        host_os = RbConfig::CONFIG["host_os"]
        case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :mac
        when /linux/
          :linux
        when /solaris|bsd/
          :unix
        else
          @errors << "Unknown operating system #{host_os.inspect}"
          nil
        end
      end
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
end
