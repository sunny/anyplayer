require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "minitest/autorun"
require "flexmock/test_unit"
require "anyplayer"

require "anyplayer/players/noplayer"
Anyplayer::PLAYERS.unshift "noplayer"


include Anyplayer
