require "rbconfig"

# The Selector is the tool that will find you the currently running player
# on your platform.
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
        player_load(player) || next

        instance = player_class(player).new
        player_on_platform?(instance) || next

        return instance if player_launched?(instance)
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
      log "#{player}:"
      begin
        require "anyplayer/players/#{player}"
        log "  loaded"
        true
      rescue LoadError => e
        log "  #{e.message}"
        @errors << "Error loading #{player}: #{e.message}"
        false
      end
    end

    def player_on_platform?(player)
      result = player.platforms.include?(platform)
      log "  not on platform" unless result
      result
    end

    def player_class(player)
      camelized = player.to_s.split(/_/).map(&:capitalize).join
      Anyplayer.const_get(camelized)
    end

    def player_launched?(player)
      seconds = 5
      begin
        Timeout.timeout(seconds) do
          launched = player.launched?
          log launched ? "  launched" : "  not launched"
          launched
        end
      rescue Timeout::Error
        log "  timed out after #{seconds} seconds"
        false
      end
    end

    def log(text)
      $stderr.puts text if verbose
    end
  end
end
