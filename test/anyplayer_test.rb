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
  
  def test_voting
    player = Anyplayer::launched
    assert_not_nil player
    assert_equal player.votes, 0
    
    first_track = player.track
    
    Anyplayer::Player::DEFAULT_VOTES_TO_SKIP.times do |i|
      player.vote
      
      # votes should be 0 if we've voted enough times
      if i == Anyplayer::Player::DEFAULT_VOTES_TO_SKIP-1
        assert_equal player.votes, 0
      else
        assert_equal player.votes, i+1
      end
    end
    
    # make sure we actually changed tracks
    assert_not_equal player.track, first_track 
  end
  
  def test_vote_resets
    player = Anyplayer::launched
    assert_not_nil player
    assert_equal player.votes, 0
    
    player.next
    assert_equal player.votes, 0

    player.prev
    assert_equal player.votes, 0
  end
end
