$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'test/unit'
require 'anyplayer'

class AnyplayerTest < Test::Unit::TestCase
  def test_music_player_running
    player = Anyplayer::launched
    assert_not_nil player
    assert player.is_a?(Anyplayer::Player)
  end
end
