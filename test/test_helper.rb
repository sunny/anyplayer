require "minitest/autorun"
require "flexmock/minitest"
require "anyplayer"

require "anyplayer/players/noplayer"
Anyplayer::PLAYERS.unshift "noplayer"

include Anyplayer
