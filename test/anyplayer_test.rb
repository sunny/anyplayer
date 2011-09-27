require "minitest/unit"
require "minitest/autorun"
require "anyplayer"

class AnyplayerTest < MiniTest::Unit::TestCase
  def setup
    @player = Anyplayer::launched
    refute_nil @player, "Make sure you have launched a player for tests to run"
  end

  def test_music_player_running
    assert_kind_of Anyplayer::Player, @player
  end


  def test_voting
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
    refute_equal @player.track, first_track

    # rewind test
    @player.prev
    @player.play
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
    refute_equal @player.track, first_track

    # rewind test
    @player.prev
    @player.play
  end
end
