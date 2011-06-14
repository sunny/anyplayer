$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'test/unit'
require 'anyplayer'

class AnyplayerTest < Test::Unit::TestCase
  def setup
    @player = Anyplayer::launched
  end

  def test_music_player_running
    assert_not_nil @player, "Make sure you have launched a player for tests to run"
    assert @player.is_a?(Anyplayer::Player)
  end

  def test_voting
    @player = Anyplayer::launched
    assert_equal @player.votes, 0

    first_track = @player.track

    Anyplayer::Player::DEFAULT_VOTES_TO_SKIP.times do |i|
      @player.vote

      # votes should be 0 if we've voted enough times
      if i == Anyplayer::Player::DEFAULT_VOTES_TO_SKIP-1
        assert_equal @player.votes, 0
      else
        assert_equal @player.votes, i+1
      end
    end

    # make sure we actually changed tracks
    assert_not_equal @player.track, first_track
  end

  def test_vote_resets
    assert_equal @player.votes, 0

    @player.next
    assert_equal @player.votes, 0

    @player.prev
    assert_equal @player.votes, 0
  end

  def test_custom_voting_quota
    assert_equal @player.votes, 0

    num_votes = 10

    first_track = @player.track

    num_votes.times do |i|
      @player.vote(num_votes)

      # votes should be 0 if we've voted enough times
      if i == num_votes-1
        assert_equal @player.votes, 0
      else
        assert_equal @player.votes, i+1
      end
    end

    # make sure we actually changed tracks
    assert_not_equal @player.track, first_track
  end
end
